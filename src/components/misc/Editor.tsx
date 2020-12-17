import { Plugins } from '@capacitor/core';
import { isPlatform } from '@ionic/react';
import React, { useContext, useRef } from 'react';
import AceEditor from 'react-ace';

import 'ace-builds/src-noconflict/mode-text';
import 'ace-builds/src-noconflict/mode-yaml';
import 'ace-builds/src-noconflict/mode-json';
import 'ace-builds/src-noconflict/theme-github';
import 'ace-builds/src-noconflict/theme-nord_dark';

import { IContext } from '../../declarations';
import { AppContext } from '../../utils/context';
import { isDarkMode } from '../../utils/helpers';

const { Keyboard } = Plugins;

interface IEditorProps {
  onChange?: (newValue: string) => void;
  readOnly: boolean;
  mode?: string;
  value: string;
  fullHeight?: boolean;
}

const Editor: React.FunctionComponent<IEditorProps> = ({
  onChange,
  readOnly,
  mode,
  value,
  fullHeight,
}: IEditorProps) => {
  const context = useContext<IContext>(AppContext);
  const editor = useRef<AceEditor>(null);

  const changeValue = (newValue: string) => {
    if (onChange) {
      onChange(newValue);
    }
  };

  if (isPlatform('hybrid')) {
    Keyboard.addListener('keyboardDidShow', () => {
      editor.current?.editor.resize();
    });

    Keyboard.addListener('keyboardDidHide', () => {
      editor.current?.editor.resize();
    });
  }

  return (
    <AceEditor
      height="100%"
      maxLines={fullHeight ? undefined : Infinity}
      mode={mode ? mode : 'yaml'}
      name="yaml-editor"
      onChange={changeValue}
      readOnly={readOnly}
      ref={editor}
      setOptions={{
        useSoftTabs: true,
      }}
      showPrintMargin={false}
      tabSize={2}
      theme={isDarkMode(context.settings.theme) ? 'nord_dark' : 'github'}
      value={value}
      width="100%"
    />
  );
};

export default Editor;
