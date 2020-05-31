import { DependencyList, useCallback, useEffect, useState, useRef } from 'react';

const useMountedState = (): (() => boolean) => {
  const mountedRef = useRef<boolean>(false);
  const get = useCallback(() => mountedRef.current, []);

  useEffect(() => {
    mountedRef.current = true;

    return () => {
      mountedRef.current = false;
    };
  });

  return get;
};

// eslint-disable-next-line @typescript-eslint/no-explicit-any
export type FnReturningPromise = (...args: any[]) => Promise<any>;

// eslint-disable-next-line @typescript-eslint/no-explicit-any
export type PromiseType<P extends Promise<any>> = P extends Promise<infer T> ? T : never;

export type AsyncState<T> =
  | {
      loading: boolean;
      error?: undefined;
      value?: undefined;
    }
  | {
      loading: true;
      error?: Error | undefined;
      value?: T;
    }
  | {
      loading: false;
      error: Error;
      value?: undefined;
    }
  | {
      loading: false;
      error?: undefined;
      value: T;
    };

type StateFromFnReturningPromise<T extends FnReturningPromise> = AsyncState<PromiseType<ReturnType<T>>>;

export type AsyncFnReturn<T extends FnReturningPromise = FnReturningPromise> = [StateFromFnReturningPromise<T>, T, T];

// useAsyncFn is a React hook that returns state and a callback for an async function or a function that returns a
// promise.
// See: https://github.com/streamich/react-use/blob/master/docs/useAsyncFn.md
export default function useAsyncFn<T extends FnReturningPromise>(
  fn: T,
  deps: DependencyList = [],
  initialState: StateFromFnReturningPromise<T> = { loading: false },
): AsyncFnReturn<T> {
  const lastCallId = useRef(0);
  const isMounted = useMountedState();
  const [state, set] = useState<StateFromFnReturningPromise<T>>(initialState);

  const callback = useCallback((...args: Parameters<T>): ReturnType<T> => {
    const callId = ++lastCallId.current;
    set((prevState) => ({ ...prevState, loading: true }));

    return fn(...args).then(
      (value) => {
        isMounted() && callId === lastCallId.current && set({ value, loading: false });

        return value;
      },
      (error) => {
        isMounted() && callId === lastCallId.current && set({ error, loading: false });

        return error;
      },
    ) as ReturnType<T>;
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, deps);

  const callbackInit = useCallback((...args: Parameters<T>): ReturnType<T> => {
    const callId = ++lastCallId.current;
    set((prevState) => ({ ...prevState, loading: true, value: undefined }));

    return fn(...args).then(
      (value) => {
        isMounted() && callId === lastCallId.current && set({ value, loading: false });

        return value;
      },
      (error) => {
        isMounted() && callId === lastCallId.current && set({ error, loading: false });

        return error;
      },
    ) as ReturnType<T>;
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, deps);

  return [state, (callback as unknown) as T, (callbackInit as unknown) as T];
}
