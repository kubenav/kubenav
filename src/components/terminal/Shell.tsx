import { Plugins } from '@capacitor/core';
import { IonButton, IonButtons, IonIcon, IonRange, IonSearchbar, IonToolbar, isPlatform } from '@ionic/react';
import { arrowBack, arrowForward, copy } from 'ionicons/icons';
import React, { useRef, useEffect, useState } from 'react';
import { Terminal } from 'xterm';
import { FitAddon } from 'xterm-addon-fit';
import { SearchAddon } from 'xterm-addon-search';

import 'xterm/css/xterm.css';

import { ITerminal } from '../../declarations';

const { Clipboard, Keyboard } = Plugins;

interface IShellProps {
  showSearch: boolean;
  showSelect: boolean;
  terminal: ITerminal;
}

const Shell: React.FunctionComponent<IShellProps> = ({ showSearch, showSelect, terminal }: IShellProps) => {
  const termRef = useRef<HTMLDivElement>(null);
  const searchRef = useRef<HTMLIonSearchbarElement>(null);
  const [term, setTerm] = useState<Terminal>();
  const [searchText, setSearchText] = useState<string>('');

  const fitAddon = new FitAddon();
  const searchAddon = new SearchAddon();

  useEffect(() => {
    setTerm(terminal.shell);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  useEffect(() => {
    return () => {
      window.removeEventListener('resize', updateTerminalSize);
    };
  });

  useEffect(() => {
    const handleTerminalInit = async () => {
      setTimeout(() => {
        if (termRef.current && term) {
          term.loadAddon(fitAddon);
          term.loadAddon(searchAddon);
          term.open(termRef.current);
          fitAddon.fit();

          term.attachCustomKeyEventHandler((event) => {
            if (event.ctrlKey && event.shiftKey && event.keyCode === 3) {
              selectCopy();
              return false;
            }

            return true;
          });

          if (terminal.webSocket) {
            term.focus();
          }

          window.addEventListener('resize', updateTerminalSize);

          if (isPlatform('hybrid')) {
            Keyboard.addListener('keyboardDidShow', () => {
              updateTerminalSize();
            });

            Keyboard.addListener('keyboardDidHide', () => {
              updateTerminalSize();
            });
          }
        }
      }, 1000);
    };

    handleTerminalInit();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [termRef, term]);

  useEffect(() => {
    if (showSearch && searchRef) {
      searchRef.current?.setFocus();
    }

    updateTerminalSize();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [showSearch]);

  const updateTerminalSize = () => {
    fitAddon.fit();

    if (showSearch) {
      term?.resize(term.cols, term.rows - 4);
    } else {
      term?.resize(term.cols, term.rows + 4);
    }
  };

  const search = (event) => {
    const text = event.detail.value ? event.detail.value : '';
    setSearchText(text);

    if (term && text !== '') {
      term?.loadAddon(searchAddon);
      searchAddon.findNext(text);
    }
  };

  const searchNext = () => {
    if (term && searchText !== '') {
      term?.loadAddon(searchAddon);
      searchAddon.findNext(searchText);
    }
  };

  const searchPrevious = () => {
    if (term && searchText !== '') {
      term?.loadAddon(searchAddon);
      searchAddon.findPrevious(searchText);
    }
  };

  const select = (event) => {
    if (term) {
      term.selectLines(event.detail.value.lower, event.detail.value.upper);
    }
  };

  const selectCopy = () => {
    if (term) {
      const selection = term.getSelection();
      Clipboard.write({ string: selection });
    }
  };

  return (
    <React.Fragment>
      {showSearch ? (
        <IonToolbar>
          <IonSearchbar
            // Add padding to the top on iOS, because this is null when the searchbar is placed in a toolbar
            // See: https://github.com/ionic-team/ionic/blob/acaa1d9ef7e4037913159c0d32829183ddc1860b/core/src/components/searchbar/searchbar.ios.scss#L160
            style={showSearch && isPlatform('ios') ? { paddingTop: '15px' } : {}}
            inputmode="search"
            value={searchText}
            onIonChange={search}
            ref={searchRef}
          />
          <IonButtons style={showSearch && isPlatform('ios') ? { paddingTop: '10px' } : {}} slot="end">
            <IonButton onClick={searchPrevious}>
              <IonIcon slot="icon-only" icon={arrowBack} />
            </IonButton>
            <IonButton onClick={searchNext}>
              <IonIcon slot="icon-only" icon={arrowForward} />
            </IonButton>
          </IonButtons>
        </IonToolbar>
      ) : null}

      {showSelect ? (
        <IonToolbar>
          <IonRange
            style={showSearch && isPlatform('ios') ? { paddingTop: '15px' } : {}}
            color="dark"
            dualKnobs={true}
            min={0}
            max={term?.buffer.normal.length}
            step={1}
            onIonChange={select}
          />
          <IonButtons style={showSearch && isPlatform('ios') ? { paddingTop: '10px' } : {}} slot="end">
            <IonButton onClick={selectCopy}>
              <IonIcon slot="icon-only" icon={copy} />
            </IonButton>
          </IonButtons>
        </IonToolbar>
      ) : null}

      <div
        style={{ width: '100%', height: showSearch || showSelect ? 'calc(100% - 56px)' : '100%' }}
        ref={termRef}
      ></div>
    </React.Fragment>
  );
};

export default Shell;
