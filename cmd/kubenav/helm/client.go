package helm

import (
	"log"
	"os"
	"time"

	"helm.sh/helm/v3/pkg/action"
	"helm.sh/helm/v3/pkg/registry"
	"helm.sh/helm/v3/pkg/release"
	"k8s.io/client-go/rest"
)

type Client interface {
	ListReleases() ([]*release.Release, error)
	GetRelease(name string, version int64) (*release.Release, error)
	ListReleaseHistory(name string) ([]*release.Release, error)
	RollbackRelease(name string, version int64, cleanupOnFail bool, dryRun bool, force bool, maxHistory int, disableHooks bool, recreate bool, timeout time.Duration, wait bool, waitForJobs bool) error
}

type client struct {
	ActionConfig *action.Configuration
}

func (c *client) ListReleases() ([]*release.Release, error) {
	listClient := action.NewList(c.ActionConfig)
	listClient.StateMask = action.ListDeployed

	return listClient.Run()
}

func (c *client) GetRelease(name string, version int64) (*release.Release, error) {
	getReleaseClient := action.NewGet(c.ActionConfig)
	getReleaseClient.Version = int(version)

	return getReleaseClient.Run(name)
}

func (c *client) RollbackRelease(name string, version int64, cleanupOnFail bool, dryRun bool, force bool, maxHistory int, disableHooks bool, recreate bool, timeout time.Duration, wait bool, waitForJobs bool) error {
	rollbackClient := action.NewRollback(c.ActionConfig)
	rollbackClient.Version = int(version)

	rollbackClient.CleanupOnFail = cleanupOnFail
	rollbackClient.DryRun = dryRun
	rollbackClient.Force = force
	rollbackClient.MaxHistory = maxHistory
	rollbackClient.DisableHooks = disableHooks
	rollbackClient.Recreate = recreate
	rollbackClient.Timeout = timeout
	rollbackClient.Wait = wait
	rollbackClient.WaitForJobs = waitForJobs

	return rollbackClient.Run(name)
}

func (c *client) ListReleaseHistory(name string) ([]*release.Release, error) {
	client := action.NewHistory(c.ActionConfig)
	client.Max = 10

	return client.Run(name)
}

func NewClient(restConfig *rest.Config, namespace string) (Client, error) {
	clientGetter := NewRESTClientGetter(namespace, nil, restConfig)

	actionConfig := new(action.Configuration)
	err := actionConfig.Init(
		clientGetter,
		namespace,
		os.Getenv("HELM_DRIVER"),
		func(format string, v ...interface{}) {
			log.Printf(format, v...)
		},
	)
	if err != nil {
		return nil, err
	}

	registryClient, err := registry.NewClient()
	if err != nil {
		return nil, err
	}

	actionConfig.RegistryClient = registryClient

	return &client{
		ActionConfig: actionConfig,
	}, nil
}
