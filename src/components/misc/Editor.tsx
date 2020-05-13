import { IonButton } from '@ionic/react';
import React, { useContext, useEffect, useRef, useState } from 'react';
import AceEditor from 'react-ace';

import 'ace-builds/src-noconflict/mode-text';
import 'ace-builds/src-noconflict/mode-yaml';
import 'ace-builds/src-noconflict/theme-ambiance';
import 'ace-builds/src-noconflict/theme-chaos';
import 'ace-builds/src-noconflict/theme-chrome';
import 'ace-builds/src-noconflict/theme-clouds';
import 'ace-builds/src-noconflict/theme-clouds_midnight';
import 'ace-builds/src-noconflict/theme-cobalt';
import 'ace-builds/src-noconflict/theme-crimson_editor';
import 'ace-builds/src-noconflict/theme-dawn';
import 'ace-builds/src-noconflict/theme-dracula';
import 'ace-builds/src-noconflict/theme-dreamweaver';
import 'ace-builds/src-noconflict/theme-eclipse';
import 'ace-builds/src-noconflict/theme-github';
import 'ace-builds/src-noconflict/theme-gob';
import 'ace-builds/src-noconflict/theme-gruvbox';
import 'ace-builds/src-noconflict/theme-idle_fingers';
import 'ace-builds/src-noconflict/theme-iplastic';
import 'ace-builds/src-noconflict/theme-katzenmilch';
import 'ace-builds/src-noconflict/theme-kr_theme';
import 'ace-builds/src-noconflict/theme-kuroir';
import 'ace-builds/src-noconflict/theme-merbivore';
import 'ace-builds/src-noconflict/theme-merbivore_soft';
import 'ace-builds/src-noconflict/theme-monokai';
import 'ace-builds/src-noconflict/theme-mono_industrial';
import 'ace-builds/src-noconflict/theme-pastel_on_dark';
import 'ace-builds/src-noconflict/theme-solarized_dark';
import 'ace-builds/src-noconflict/theme-solarized_light';
import 'ace-builds/src-noconflict/theme-sqlserver';
import 'ace-builds/src-noconflict/theme-terminal';
import 'ace-builds/src-noconflict/theme-textmate';
import 'ace-builds/src-noconflict/theme-tomorrow';
import 'ace-builds/src-noconflict/theme-tomorrow_night';
import 'ace-builds/src-noconflict/theme-tomorrow_night_blue';
import 'ace-builds/src-noconflict/theme-tomorrow_night_bright';
import 'ace-builds/src-noconflict/theme-tomorrow_night_eighties';
import 'ace-builds/src-noconflict/theme-twilight';
import 'ace-builds/src-noconflict/theme-vibrant_ink';
import 'ace-builds/src-noconflict/theme-xcode';

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

    return () => {};
  }, [value]); /* eslint-disable-line */

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
        theme={context.settings.editorTheme}
        value={value}
        width="100%"
      />
    </React.Fragment>
  );
};

export default Editor;
