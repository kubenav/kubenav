package main

import (
	"fmt"
	"os/exec"
	"runtime"
	"sort"

	"github.com/kubenav/kubenav/pkg/kube"

	"github.com/asticode/go-astikit"
	"github.com/asticode/go-astilectron"
	log "github.com/sirupsen/logrus"
)

// openBrowser opens a given URL in the standard browser of the current OS.
// See: https://gist.github.com/hyg/9c4afcd91fe24316cbf0
func openBrowser(url string) {
	var err error

	switch runtime.GOOS {
	case "linux":
		err = exec.Command("xdg-open", url).Start()
	case "windows":
		err = exec.Command("rundll32", "url.dll,FileProtocolHandler", url).Start()
	case "darwin":
		err = exec.Command("open", url).Start()
	default:
		err = fmt.Errorf("unsupported platform")
	}
	if err != nil {
		log.Fatal(err)
	}
}

// createClusterMenuItem creates a new menu item for a given context from the Kubeconfig file.
// When the cluster is selected an "cluster" event will be send to the frontend via SSE.
func createClusterMenuItem(cluster string) astilectron.MenuItemOptions {
	return astilectron.MenuItemOptions{
		Label: astikit.StrPtr(cluster),
		OnClick: func(e astilectron.Event) (deleteListener bool) {
			log.Debugf("Menu item '%s' has been clicked", cluster)
			messageChannel <- Message{Event: "cluster", Data: cluster}
			return
		},
	}
}

// createFileMenu creates the items for the "File" menu. If a new version was found an update item is added. If no new
// version was found the "Update Available" hint is hidden.
func createFileMenu(updateAvailable bool) *astilectron.MenuItemOptions {
	if updateAvailable {
		return &astilectron.MenuItemOptions{
			Label: astikit.StrPtr("File"),
			SubMenu: []*astilectron.MenuItemOptions{
				{
					Label: astikit.StrPtr("Clusters"),
					OnClick: func(e astilectron.Event) (deleteListener bool) {
						log.Debugf("Menu item 'Clusters' has been clicked")
						messageChannel <- Message{Event: "navigation", Data: "/settings/clusters"}
						return
					},
				},
				{
					Label: astikit.StrPtr("General"),
					OnClick: func(e astilectron.Event) (deleteListener bool) {
						log.Debugf("Menu item 'General' has been clicked")
						messageChannel <- Message{Event: "navigation", Data: "/settings/general"}
						return
					},
				},
				{
					Label: astikit.StrPtr("Info"),
					OnClick: func(e astilectron.Event) (deleteListener bool) {
						log.Debugf("Menu item 'Info' has been clicked")
						messageChannel <- Message{Event: "navigation", Data: "/settings/info"}
						return
					},
				},
				{Type: astilectron.MenuItemTypeSeparator},
				{
					Label: astikit.StrPtr("Update Available"),
					OnClick: func(e astilectron.Event) (deleteListener bool) {
						log.Debugf("Menu item 'Update Available' has been clicked")
						openBrowser("https://github.com/kubenav/kubenav/releases")
						return
					},
				},
				{Type: astilectron.MenuItemTypeSeparator},
				{Label: astikit.StrPtr("Quit"), Role: astilectron.MenuItemRoleQuit},
			},
		}
	}

	return &astilectron.MenuItemOptions{
		Label: astikit.StrPtr("File"),
		SubMenu: []*astilectron.MenuItemOptions{
			{
				Label: astikit.StrPtr("Clusters"),
				OnClick: func(e astilectron.Event) (deleteListener bool) {
					log.Debugf("Menu item 'Clusters' has been clicked")
					messageChannel <- Message{Event: "navigation", Data: "/settings/clusters"}
					return
				},
			},
			{
				Label: astikit.StrPtr("General"),
				OnClick: func(e astilectron.Event) (deleteListener bool) {
					log.Debugf("Menu item 'General' has been clicked")
					messageChannel <- Message{Event: "navigation", Data: "/settings/general"}
					return
				},
			},
			{
				Label: astikit.StrPtr("Info"),
				OnClick: func(e astilectron.Event) (deleteListener bool) {
					log.Debugf("Menu item 'Info' has been clicked")
					messageChannel <- Message{Event: "navigation", Data: "/settings/info"}
					return
				},
			},
			{Type: astilectron.MenuItemTypeSeparator},
			{Label: astikit.StrPtr("Quit"), Role: astilectron.MenuItemRoleQuit},
		},
	}
}

// getMenuOptions returns the menu for the Electron app.
func getMenuOptions(updateAvailable bool, client kube.Client) ([]*astilectron.MenuItemOptions, error) {
	fileMenu := createFileMenu(updateAvailable)

	// Load all clusters from the Kubeconfig file and sort the clusters alphabetical. Then iterate over the clusters and
	// create a menu entry for each cluster.
	clusters, err := client.Clusters()
	if err != nil {
		return nil, err
	}

	contexts := make([]string, 0, len(clusters))
	for c := range clusters {
		contexts = append(contexts, c)
	}
	sort.Strings(contexts)

	var clusterSubMenu []*astilectron.MenuItemOptions
	for _, context := range contexts {
		item := createClusterMenuItem(context)
		clusterSubMenu = append(clusterSubMenu, &item)
	}

	return []*astilectron.MenuItemOptions{
		fileMenu,
		{
			Label: astikit.StrPtr("Edit"),
			SubMenu: []*astilectron.MenuItemOptions{
				{Label: astikit.StrPtr("Undo"), Role: astilectron.MenuItemRoleUndo},
				{Label: astikit.StrPtr("Redo"), Role: astilectron.MenuItemRoleRedo},
				{Type: astilectron.MenuItemTypeSeparator},
				{Label: astikit.StrPtr("Copy"), Role: astilectron.MenuItemRoleCopy},
				{Label: astikit.StrPtr("Cut"), Role: astilectron.MenuItemRoleCut},
				{Label: astikit.StrPtr("Paste"), Role: astilectron.MenuItemRolePaste},
				{Label: astikit.StrPtr("Select All"), Role: astilectron.MenuItemRoleSelectAll},
				{Type: astilectron.MenuItemTypeSeparator},
				{Label: astikit.StrPtr("Reload"), Role: astilectron.MenuItemRoleReload},
				{Label: astikit.StrPtr("Full Screen"), Role: astilectron.MenuItemRoleToggleFullScreen},
			},
		},
		{
			Label: astikit.StrPtr("View"),
			SubMenu: []*astilectron.MenuItemOptions{
				{
					Label: astikit.StrPtr("Workloads"),
					SubMenu: []*astilectron.MenuItemOptions{
						{
							Label: astikit.StrPtr("Cron Jobs"),
							OnClick: func(e astilectron.Event) (deleteListener bool) {
								log.Debugf("Menu item 'Cron Jobs' has been clicked")
								messageChannel <- Message{Event: "navigation", Data: "/resources/workloads/cronjobs"}
								return
							},
						},
						{
							Label: astikit.StrPtr("Daemon Sets"),
							OnClick: func(e astilectron.Event) (deleteListener bool) {
								log.Debugf("Menu item 'Daemon Sets' has been clicked")
								messageChannel <- Message{Event: "navigation", Data: "/resources/workloads/daemonsets"}
								return
							},
						},
						{
							Label: astikit.StrPtr("Deployments"),
							OnClick: func(e astilectron.Event) (deleteListener bool) {
								log.Debugf("Menu item 'Deployments' has been clicked")
								messageChannel <- Message{Event: "navigation", Data: "/resources/workloads/deployments"}
								return
							},
						},
						{
							Label: astikit.StrPtr("Jobs"),
							OnClick: func(e astilectron.Event) (deleteListener bool) {
								log.Debugf("Menu item 'Jobs' has been clicked")
								messageChannel <- Message{Event: "navigation", Data: "/resources/workloads/jobs"}
								return
							},
						},
						{
							Label: astikit.StrPtr("Pods"),
							OnClick: func(e astilectron.Event) (deleteListener bool) {
								log.Debugf("Menu item 'Pods' has been clicked")
								messageChannel <- Message{Event: "navigation", Data: "/resources/workloads/pods"}
								return
							},
						},
						{
							Label: astikit.StrPtr("Replica Sets"),
							OnClick: func(e astilectron.Event) (deleteListener bool) {
								log.Debugf("Menu item 'Replica Sets' has been clicked")
								messageChannel <- Message{Event: "navigation", Data: "/resources/workloads/replicasets"}
								return
							},
						},
						{
							Label: astikit.StrPtr("Replication Controllers"),
							OnClick: func(e astilectron.Event) (deleteListener bool) {
								log.Debugf("Menu item 'Replication Controllers' has been clicked")
								messageChannel <- Message{Event: "navigation", Data: "/resources/workloads/replicationcontrollers"}
								return
							},
						},
						{
							Label: astikit.StrPtr("Stateful Sets"),
							OnClick: func(e astilectron.Event) (deleteListener bool) {
								log.Debugf("Menu item 'Stateful Sets' has been clicked")
								messageChannel <- Message{Event: "navigation", Data: "/resources/workloads/statefulsets"}
								return
							},
						},
					},
				},
				{
					Label: astikit.StrPtr("Discovery and Load Balancing"),
					SubMenu: []*astilectron.MenuItemOptions{
						{
							Label: astikit.StrPtr("Endpoints"),
							OnClick: func(e astilectron.Event) (deleteListener bool) {
								log.Debugf("Menu item 'Endpoint' has been clicked")
								messageChannel <- Message{Event: "navigation", Data: "/resources/discovery-and-loadbalancing/endpoints"}
								return
							},
						},
						{
							Label: astikit.StrPtr("Horizontal Pod Autoscalers"),
							OnClick: func(e astilectron.Event) (deleteListener bool) {
								log.Debugf("Menu item 'Horizontal Pod Autoscalers' has been clicked")
								messageChannel <- Message{Event: "navigation", Data: "/resources/discovery-and-loadbalancing/horizontalpodautoscalers"}
								return
							},
						},
						{
							Label: astikit.StrPtr("Ingresses"),
							OnClick: func(e astilectron.Event) (deleteListener bool) {
								log.Debugf("Menu item 'Ingresses' has been clicked")
								messageChannel <- Message{Event: "navigation", Data: "/resources/discovery-and-loadbalancing/ingresses"}
								return
							},
						},
						{
							Label: astikit.StrPtr("Network Policies"),
							OnClick: func(e astilectron.Event) (deleteListener bool) {
								log.Debugf("Menu item 'Network Policies' has been clicked")
								messageChannel <- Message{Event: "navigation", Data: "/resources/discovery-and-loadbalancing/networkpolicies"}
								return
							},
						},
						{
							Label: astikit.StrPtr("Services"),
							OnClick: func(e astilectron.Event) (deleteListener bool) {
								log.Debugf("Menu item 'Services' has been clicked")
								messageChannel <- Message{Event: "navigation", Data: "/resources/discovery-and-loadbalancing/services"}
								return
							},
						},
					},
				},
				{
					Label: astikit.StrPtr("Config and Storage"),
					SubMenu: []*astilectron.MenuItemOptions{
						{
							Label: astikit.StrPtr("Config Maps"),
							OnClick: func(e astilectron.Event) (deleteListener bool) {
								log.Debugf("Menu item 'Config Maps' has been clicked")
								messageChannel <- Message{Event: "navigation", Data: "/resources/config-and-storage/configmaps"}
								return
							},
						},
						{
							Label: astikit.StrPtr("Persistent Volumes"),
							OnClick: func(e astilectron.Event) (deleteListener bool) {
								log.Debugf("Menu item 'Persistent Volumes' has been clicked")
								messageChannel <- Message{Event: "navigation", Data: "/resources/config-and-storage/persistentvolumes"}
								return
							},
						},
						{
							Label: astikit.StrPtr("Persistent Volume Claims"),
							OnClick: func(e astilectron.Event) (deleteListener bool) {
								log.Debugf("Menu item 'Persistent Volume Claims' has been clicked")
								messageChannel <- Message{Event: "navigation", Data: "/resources/config-and-storage/persistentvolumeclaims"}
								return
							},
						},
						{
							Label: astikit.StrPtr("Pod Disruption Budgets"),
							OnClick: func(e astilectron.Event) (deleteListener bool) {
								log.Debugf("Menu item 'Pod Disruption Budgets' has been clicked")
								messageChannel <- Message{Event: "navigation", Data: "/resources/config-and-storage/poddisruptionbudgets"}
								return
							},
						},
						{
							Label: astikit.StrPtr("Secrets"),
							OnClick: func(e astilectron.Event) (deleteListener bool) {
								log.Debugf("Menu item 'Secrets' has been clicked")
								messageChannel <- Message{Event: "navigation", Data: "/resources/config-and-storage/secrets"}
								return
							},
						},
						{
							Label: astikit.StrPtr("Service Accounts"),
							OnClick: func(e astilectron.Event) (deleteListener bool) {
								log.Debugf("Menu item 'Service Accounts' has been clicked")
								messageChannel <- Message{Event: "navigation", Data: "/resources/config-and-storage/serviceaccounts"}
								return
							},
						},
						{
							Label: astikit.StrPtr("Storage Classes"),
							OnClick: func(e astilectron.Event) (deleteListener bool) {
								log.Debugf("Menu item 'Storage Classes' has been clicked")
								messageChannel <- Message{Event: "navigation", Data: "/resources/config-and-storage/storageclasses"}
								return
							},
						},
					},
				},
				{
					Label: astikit.StrPtr("RBAC"),
					SubMenu: []*astilectron.MenuItemOptions{
						{
							Label: astikit.StrPtr("Cluster Roles"),
							OnClick: func(e astilectron.Event) (deleteListener bool) {
								log.Debugf("Menu item 'Cluster Roles' has been clicked")
								messageChannel <- Message{Event: "navigation", Data: "/resources/rbac/clusterroles"}
								return
							},
						},
						{
							Label: astikit.StrPtr("Cluster Role Bindings"),
							OnClick: func(e astilectron.Event) (deleteListener bool) {
								log.Debugf("Menu item 'Cluster Role Bindings' has been clicked")
								messageChannel <- Message{Event: "navigation", Data: "/resources/rbac/clusterrolebindings"}
								return
							},
						},
						{
							Label: astikit.StrPtr("Roles"),
							OnClick: func(e astilectron.Event) (deleteListener bool) {
								log.Debugf("Menu item 'Roles' has been clicked")
								messageChannel <- Message{Event: "navigation", Data: "/resources/rbac/roles"}
								return
							},
						},
						{
							Label: astikit.StrPtr("Role Bindings"),
							OnClick: func(e astilectron.Event) (deleteListener bool) {
								log.Debugf("Menu item 'Role Bindings' has been clicked")
								messageChannel <- Message{Event: "navigation", Data: "/resources/rbac/rolebindings"}
								return
							},
						},
					},
				},
				{
					Label: astikit.StrPtr("Cluster"),
					SubMenu: []*astilectron.MenuItemOptions{
						{
							Label: astikit.StrPtr("Component Statuses"),
							OnClick: func(e astilectron.Event) (deleteListener bool) {
								log.Debugf("Menu item 'Component Statuses' has been clicked")
								messageChannel <- Message{Event: "navigation", Data: "/resources/cluster/componentstatuses"}
								return
							},
						},
						{
							Label: astikit.StrPtr("Custom Resource Definitions"),
							OnClick: func(e astilectron.Event) (deleteListener bool) {
								log.Debugf("Menu item 'Custom Resource Definitions' has been clicked")
								messageChannel <- Message{Event: "navigation", Data: "/resources/cluster/customresourcedefinitions"}
								return
							},
						},
						{
							Label: astikit.StrPtr("Events"),
							OnClick: func(e astilectron.Event) (deleteListener bool) {
								log.Debugf("Menu item 'Events' has been clicked")
								messageChannel <- Message{Event: "navigation", Data: "/resources/cluster/events"}
								return
							},
						},
						{
							Label: astikit.StrPtr("Namespaces"),
							OnClick: func(e astilectron.Event) (deleteListener bool) {
								log.Debugf("Menu item 'Namespaces' has been clicked")
								messageChannel <- Message{Event: "navigation", Data: "/resources/cluster/namespaces"}
								return
							},
						},
						{
							Label: astikit.StrPtr("Nodes"),
							OnClick: func(e astilectron.Event) (deleteListener bool) {
								log.Debugf("Menu item 'Nodes' has been clicked")
								messageChannel <- Message{Event: "navigation", Data: "/resources/cluster/nodes"}
								return
							},
						},
						{
							Label: astikit.StrPtr("Pod Security Policies"),
							OnClick: func(e astilectron.Event) (deleteListener bool) {
								log.Debugf("Menu item 'Pod Security Policies' has been clicked")
								messageChannel <- Message{Event: "navigation", Data: "/resources/cluster/podsecuritypolicies"}
								return
							},
						},
					},
				},
			},
		},
		{
			Label:   astikit.StrPtr("Clusters"),
			SubMenu: clusterSubMenu,
		},
	}, nil
}
