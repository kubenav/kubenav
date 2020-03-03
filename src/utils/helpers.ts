import { V1LabelSelector, V1Subject } from '@kubernetes/client-node';

// formatBytes converts a given number of the unit bytes into a human readable string.
// If the si parameter is true, the function uses 1000 instead of 1024 to convert the given number.
// See: https://stackoverflow.com/a/14919494
export const formatBytes = (bytes: number, si: boolean): string => {
  const thresh = si ? 1000 : 1024;
  const units = si ? ['kB','MB','GB','TB','PB','EB','ZB','YB'] : ['kiB','MiB','GiB','TiB','PiB','EiB','ZiB','YiB'];

  if (Math.abs(bytes) < thresh) {
    return bytes + ' B';
  }

  let u = -1;

  do {
    bytes /= thresh;
    ++u;
  } while(Math.abs(bytes) >= thresh && u < units.length - 1);

  return bytes.toFixed(1)+' '+units[u];
};

// formatResourceValue converts the given value for CPU, memory or ephemeral storage to another unit.
// Idea: Maybe we can reuse the formatBytes function for memory and ephemeral storage.
export const formatResourceValue = (type: string, value: string): string => {
  if (value === '' || value === undefined) {
    return '';
  }

  if (type === 'cpu') {
    if (value.slice(-1) === 'm') {
      return value;
    }

    if (value.slice(-1) === 'n') {
      return Math.round(parseInt(value.slice(0, -1)) / 1000000) + 'm';
    }

    return (parseInt(value) * 1000) + 'm';
  }

  if (type === 'memory') {
    if (value.slice(-2) === 'Ki') {
      return Math.round(parseInt(value.slice(0, -2)) / 1024) + 'Mi';
    }

    if (value.slice(-2) === 'Mi') {
      return value;
    }

    if (value.slice(-2) === 'Gi') {
      return Math.round(parseInt(value.slice(0, -2)) * 1024) + 'Mi';
    }

    return value;
  }

  if (type === 'ephemeral-storage') {
    if (value.slice(-2) === 'Ki') {
      return Math.round(parseInt(value.slice(0, -2)) / 1024 / 1024) + 'Gi';
    }

    if (value.slice(-2) === 'Mi') {
      return Math.round(parseInt(value.slice(0, -2)) / 1024) + 'Gi';
    }

    if (value.slice(-2) === 'Gi') {
      return value;
    }

    return Math.round(parseInt(value) / 1024 / 1024 / 1024) + 'Gi';
  }

  return value
};

// getProperty returns the property of an object for a given key.
export const getProperty = (obj: any, key: string) => {
  return key.split('.').reduce((o, x) => {
    return (typeof o == 'undefined' || o === null) ? o : o[x];
  }, obj);
};

// isBase64 checks a given string, if it is a valid base64 encoded string.
// See: https://github.com/validatorjs/validator.js/blob/master/src/lib/isBase64.js
export const  isBase64 = (str: string): boolean => {
  const len = str.length;
  const firstPaddingChar = str.indexOf('=');

  if (str === '') {
    return false;
  }

  if (!len || len % 4 !== 0 || /[^A-Z0-9+/=]/i.test(str)) {
    return false;
  }

  return firstPaddingChar === -1 || firstPaddingChar === len - 1 || (firstPaddingChar === len - 2 && str[len - 1] === '=');
};

// isJSON checks a given string if it is valid JSON.
// It tries to parse the string, and if it fails, the function returns false, else it returns true.
export const isJSON = (data: string): boolean => {
  try {
    JSON.parse(data);
  } catch (err) {
    return false;
  }

  return true;
};

// isNamespaced checks if the given resource type is a namespaced resource or a cluster wide resource.
export const isNamespaced = (type: string): boolean => {
  return !(type === 'persistentvolumes' || type === 'clusterroles' || type === 'clusterrolebindings' || type === 'customresourcedefinitions' || type === 'namespaces' || type === 'nodes');
};

// labelSelector is used to create the selector for pods for a given labelSelector.
export const labelSelector = (labelSelector: V1LabelSelector): string => {
  if (labelSelector.matchLabels) {
    return matchLabels(labelSelector.matchLabels);
  }

  return '';
};

// matchLabels returns a string wiche can be used to select specific resources via labelSelector.
export const matchLabels = (labels: {[key: string]: string}): string => {
  let selectors: string[] = [];

  for (let label in labels) {
    selectors.push(`${label}=${labels[label]}`);
  }

  return selectors.join(',');
};

// randomString generates a random string of the given length.
// See: https://stackoverflow.com/a/1349426
export const randomString = (length: number): string => {
  let result = '';
  const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  const charactersLength = characters.length;

  for ( let i = 0; i < length; i++ ) {
    result += characters.charAt(Math.floor(Math.random() * charactersLength));
  }

  return result;
};

// subjectLink returns the link for a subject when it is of kind ServiceAccount.
export const subjectLink = (subject: V1Subject): string => {
  if (subject.kind === 'ServiceAccount') {
    return `/resources/config-and-storage/serviceaccounts/${subject.namespace}/${subject.name}`;
  }

  return '';
};

// timeDifference calculates the difference of two given timestamps and returns a human readable string for the
// difference.
export const timeDifference = (current: number, previous: number): string => {
  const msPerMinute = 60 * 1000;
  const msPerHour = msPerMinute * 60;
  const msPerDay = msPerHour * 24;
  const msPerYear = msPerDay * 365;

  const elapsed = current - previous;

  if (elapsed < msPerMinute) {
    return Math.round(elapsed/1000) + 's';
  } else if (elapsed < msPerHour) {
    return Math.round(elapsed/msPerMinute) + 'm';
  } else if (elapsed < msPerDay ) {
    return Math.round(elapsed/msPerHour ) + 'h';
  } else if (elapsed < msPerYear) {
    return Math.round(elapsed/msPerDay) + 'd';
  } else {
    return Math.round(elapsed/msPerYear ) + 'y';
  }
};
