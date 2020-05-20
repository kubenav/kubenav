import { IonButton } from '@ionic/react';
import React, { useContext, useEffect, useRef, useState } from 'react';
import AceEditor from 'react-ace';

import 'ace-builds/src-noconflict/mode-text';
import 'ace-builds/src-noconflict/mode-yaml';
import 'ace-builds/src-noconflict/theme-github';
import 'ace-builds/src-noconflict/theme-nord_dark';

import { IContext } from '../../declarations';
import { AppContext } from '../../utils/context';

interface IEditorProps {
  onChange?: (newValue: string) => void;
  readOnly: boolean;
  mode?: string;
  value: string;
  fullHeight?: boolean;
  scrollToBottomButton?: boolean;
}

const Editor: React.FunctionComponent<IEditorProps> = ({
  onChange,
  readOnly,
  mode,
  value,
  fullHeight,
  scrollToBottomButton,
}: IEditorProps) => {
  const context = useContext<IContext>(AppContext);
  const editor = useRef<AceEditor>(null);

  const [showScrollToBottomButton, setShowScrollToBottomButton] = useState<boolean>(scrollToBottomButton === true);

  useEffect(() => {
    setShowScrollToBottomButton(scrollToBottomButton === true);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [value]);

  const changeValue = (newValue: string) => {
    if (onChange) {
      onChange(newValue);
    }
  };

  const scroll = () => {
    if (editor.current) {
      const rows = editor.current.editor.session.getLength();
      const lastVisibleRow = editor.current.editor.getLastVisibleRow();

      if (rows < lastVisibleRow + 10) {
        setShowScrollToBottomButton(false);
      }
    }
  };

  const scrollToBottom = () => {
    if (editor.current) {
      const rows = editor.current.editor.session.getLength();
      editor.current.editor.gotoLine(rows);
    }

    setShowScrollToBottomButton(false);
  };

  return (
    <React.Fragment>
      {showScrollToBottomButton ? (
        <div className="editor-scroll-to-bottom-button">
          <IonButton
            size="small"
            onClick={() => {
              scrollToBottom();
            }}
          >
            Scroll to Bottom
          </IonButton>
        </div>
      ) : null}

      <AceEditor
        height="100%"
        maxLines={fullHeight ? undefined : Infinity}
        mode={mode ? mode : 'yaml'}
        name="yaml-editor"
        onChange={changeValue}
        onScroll={scroll}
        readOnly={readOnly}
        ref={editor}
        setOptions={{
          useSoftTabs: true,
        }}
        showPrintMargin={false}
        tabSize={2}
        theme={context.settings.darkMode ? 'nord_dark' : 'github'}
        value={value}
        width="100%"
      />
    </React.Fragment>
  );
};

export default Editor;
