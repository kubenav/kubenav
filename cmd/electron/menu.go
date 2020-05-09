package main

import (
	"github.com/kubenav/kubenav/pkg/kube"

	"github.com/asticode/go-astikit"
	"github.com/asticode/go-astilectron"
	"github.com/sirupsen/logrus"
)

func createClusterMenuItem(cluster string, log *logrus.Logger) astilectron.MenuItemOptions {
	return astilectron.MenuItemOptions{
		Label: astikit.StrPtr(cluster),
		OnClick: func(e astilectron.Event) (deleteListener bool) {
			log.Debugf("Menu item '%s' has been clicked", cluster)
			messageChannel <- Message{Event: "cluster", Data: cluster}
			return
		},
	}
}

func getMenuOptions(client *kube.Client, log *logrus.Logger) ([]*astilectron.MenuItemOptions, error) {
	fileMenu := &astilectron.MenuItemOptions{
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

	clusters, err := client.Clusters()
	if err != nil {
		return nil, err
	}

	var clusterSubMenu []*astilectron.MenuItemOptions
	for cluster := range clusters {
		item := createClusterMenuItem(cluster, log)
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
							Label: astikit.StrPtr("Ingresses"),
							OnClick: func(e astilectron.Event) (deleteListener bool) {
								log.Debugf("Menu item 'Ingresses' has been clicked")
								messageChannel <- Message{Event: "navigation", Data: "/resources/discovery-and-loadbalancing/ingresses"}
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
								messageChannel <- Message{Event: "navigation", Data: "/resources/rbac/clusterrolebinding"}
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
