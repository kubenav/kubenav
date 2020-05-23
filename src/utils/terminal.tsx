import { IonFab, IonFabButton, IonIcon } from '@ionic/react';
import { terminal as terminalIcon } from 'ionicons/icons';
import React, { useState, ReactElement } from 'react';

import { ITerminal, ITerminalContext } from '../declarations';
import Terminals from '../components/terminal/Terminals';

// Creates a Context object. When React renders a component that subscribes to this Context object it will read the
// current context value from the closest matching Provider above it in the tree.
export const TerminalContext = React.createContext<ITerminalContext>({
  terminals: [],

  // eslint-disable-next-line @typescript-eslint/no-empty-function
  add: () => {},
});

// A React component that subscribes to context changes. This lets you subscribe to a context within a function
// component.
export const TerminalContextConsumer = TerminalContext.Consumer;

interface ITerminalContextProvider {
  children: ReactElement;
}

// Every Context object comes with a Provider React component that allows consuming components to subscribe to context
// changes.
export const TerminalContextProvider: React.FunctionComponent<ITerminalContextProvider> = ({
  children,
}: ITerminalContextProvider) => {
  const [showTerminals, setShowTerminals] = useState<boolean>(false);
  const [activeTerminal, setActiveTerminal] = useState<string>('');
  const [terminals, setTerminals] = useState<ITerminal[]>([]);

  const add = (terminal: ITerminal) => {
    setActiveTerminal(`term_${terminals.length}`);
    setTerminals([...terminals, terminal]);
    setShowTerminals(true);
  };

  const remove = (index: number) => {
    if (terminals[index].eventSource) {
      terminals[index].eventSource?.close();
    }

    if (terminals[index].webSocket) {
      terminals[index].webSocket?.close();
    }

    if (terminals.length > 1) {
      setActiveTerminal('term_0');
      const copy = [...terminals];
      copy.splice(index, 1);
      setTerminals(copy);
    } else {
      setShowTerminals(false);
      setTerminals([]);
    }
  };

  return (
    <TerminalContext.Provider
      value={{
        terminals: terminals,

        add: add,
      }}
    >
      {!showTerminals && terminals.length > 0 ? (
        <IonFab vertical="bottom" horizontal="end" slot="fixed">
          <IonFabButton onClick={() => setShowTerminals(true)}>
            <IonIcon icon={terminalIcon} color="#326ce5" />
          </IonFabButton>
        </IonFab>
      ) : null}

      <Terminals
        showModal={showTerminals}
        setShowModal={setShowTerminals}
        terminals={terminals}
        activeTerminal={activeTerminal}
        setActiveTerminal={setActiveTerminal}
        removeTerminal={remove}
      />

      {children}
    </TerminalContext.Provider>
  );
};
