import { IonAlert, IonIcon, IonItem, IonLabel } from '@ionic/react';
import { V1beta1CronJob, V1Job } from '@kubernetes/client-node';
import { caretForwardCircle } from 'ionicons/icons';
import React, { useContext, useState } from 'react';

import { IContext, TActivator } from '../../../../declarations';
import { kubernetesRequest } from '../../../../utils/api';
import { AppContext } from '../../../../utils/context';
import { randomString } from '../../../../utils/helpers';
import { resources } from '../../../../utils/resources';

interface ICreateJobItemActivatorProps {
  activator: TActivator;
  onClick: () => void;
}

export const CreateJobItemActivator: React.FunctionComponent<ICreateJobItemActivatorProps> = ({
  activator,
  onClick,
}: ICreateJobItemActivatorProps) => {
  if (activator === 'item') {
    return (
      <IonItem button={true} detail={false} onClick={onClick}>
        <IonIcon slot="end" color="primary" icon={caretForwardCircle} />
        <IonLabel>Create Job</IonLabel>
      </IonItem>
    );
  } else {
    return null;
  }
};

interface ICreateJobItemProps {
  show: boolean;
  hide: () => void;
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  item: V1beta1CronJob;
  closeAction?: () => void;
}

const CreateJobItem: React.FunctionComponent<ICreateJobItemProps> = ({ show, hide, item }: ICreateJobItemProps) => {
  const context = useContext<IContext>(AppContext);

  const [error, setError] = useState<string>('');

  const jobName = `${item.metadata && item.metadata.name ? item.metadata.name : ''}-manual-${randomString(
    6,
  )}`.toLowerCase();

  const handleCreateJob = async () => {
    try {
      if (item.metadata && item.metadata.namespace && item.metadata.name && item.spec && item.spec.jobTemplate.spec) {
        const jobURL = resources.workloads.pages.jobs.listURL(
          item.metadata && item.metadata.namespace ? item.metadata.namespace : '',
        );

        const job: V1Job = {
          kind: 'Job',
          apiVersion: 'batch/v1',
          metadata: {
            name: jobName,
            namespace: item.metadata.namespace,
            labels: {
              'job-name': jobName,
            },
            annotations: {
              'cronjob.kubernetes.io/instantiate': 'manual',
            },
          },
          spec: {
            parallelism: item.spec.jobTemplate.spec.parallelism,
            completions: item.spec.jobTemplate.spec.completions,
            backoffLimit: item.spec.jobTemplate.spec.backoffLimit,
            template: {
              metadata: {
                labels: {
                  'job-name': jobName,
                },
              },
              spec: item.spec.jobTemplate.spec.template.spec,
            },
          },
        };

        await kubernetesRequest(
          'POST',
          jobURL,
          JSON.stringify(job),
          context.settings,
          await context.kubernetesAuthWrapper(''),
        );
      }
    } catch (err) {
      setError(err);
    }
  };

  return (
    <React.Fragment>
      {error !== '' ? (
        <IonAlert
          isOpen={error !== ''}
          onDidDismiss={() => setError('')}
          header={`Could not create Job ${jobName}`}
          message={error}
          buttons={['OK']}
        />
      ) : null}

      <IonAlert
        isOpen={show}
        onDidDismiss={hide}
        header={item.metadata ? item.metadata.name : ''}
        message={`Do you really want to create the Job ${jobName}?`}
        buttons={[
          { text: 'Cancel', role: 'cancel', handler: hide },
          { text: 'Create', handler: () => handleCreateJob() },
        ]}
      />
    </React.Fragment>
  );
};

export default CreateJobItem;
