import React from 'react';

import { AppSections } from '../../declarations';
import Section from './Section'

interface ISectionsProps {
  sections: AppSections;
  isMenu: boolean;
}

const Sections: React.FunctionComponent<ISectionsProps> = ({ sections, isMenu }) => {
  return (
    <React.Fragment>
      {Object.keys(sections).map(sectionKey =>
        <Section key={sectionKey} pages={sections[sectionKey].pages} title={sections[sectionKey].title} sectionKey={sectionKey} isMenu={isMenu} />
      )}
    </React.Fragment>
  )
};

export default Sections;
