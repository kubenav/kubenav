import 'package:flutter/material.dart';

import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';

class HelpItem {
  String title;
  IconData icon;
  String markdown;

  HelpItem({required this.title, required this.icon, required this.markdown});
}

class HelpSection {
  String title;
  List<HelpItem> items;

  HelpSection({required this.title, required this.items});
}

abstract class Help {
  static List<HelpSection> list = [
    HelpSection(
      title: 'Clusters',
      items: [
        HelpItem(
          title: 'Add a Cluster',
          icon: CustomIcons.clusters,
          markdown: '''
To add a new cluster to kubenav, you can have to go to the **Settings** page and select **View all** in the clusters section.

![Add a Cluster](resource:assets/help/clusters-add-cluster-1.png)

On the following page you can select one of the cluster providers on the top, to add a cluster to kubenav. Please also take a look at the providers section in the documentation, to see how the different cluster providers can be used.

![Add a Cluster](resource:assets/help/clusters-add-cluster-2.png)
          ''',
        ),
        HelpItem(
          title: 'Edit a Cluster',
          icon: CustomIcons.clusters,
          markdown: '''
To edit a cluster you have to go to **Clusters** page (**Settings** -> **View all**). Then **long tap** on the cluster name and select **Edit** from the opened modal.

![Edit a Cluster](resource:assets/help/clusters-options-cluster-1.png)

You can edit the following properties of a cluster:

- Name
- Server
- Certificate Authority Data
- Insecure Skip TLS Verify
- Client Certificate Data
- Client Key Data
- Token
- Username
- Password
- Namespace
          ''',
        ),
        HelpItem(
          title: 'Delete a Cluster',
          icon: CustomIcons.clusters,
          markdown: '''
To edit a cluster you have to go to **Clusters** page (**Settings** -> **View all**). Then **long tap** on the cluster name and select **Delete** from the opened modal.

![Delete a Cluster](resource:assets/help/clusters-options-cluster-1.png)
          ''',
        ),
        HelpItem(
          title: 'Switch between Clusters',
          icon: CustomIcons.clusters,
          markdown: '''
There are multiple ways to switch between clusters:

- You can go to the **Settings** page and select a cluster in the **Clusters** section
- You can go to **Settings** -> **View all** and select a cluster
- You can click on the **Clusters** icon and select a cluster

![Switch between Clusters](resource:assets/help/clusters-switch-clusters-1.png)
          ''',
        ),
        HelpItem(
          title: 'Sort Clusters',
          icon: CustomIcons.clusters,
          markdown: '''
You can sort your clusters on the **Clusters** page (**Settings** -> **View all**), so that your the cluster which you have to access the most is always on the top.

To sort the clusters you have to **press on the sort icon**. Afterwards you can move the clusters up or down.
          ''',
        ),
      ],
    ),
    HelpSection(
      title: 'Providers',
      items: [
        HelpItem(
          title: 'Kubeconfig',
          icon: CustomIcons.kubernetes,
          markdown: '''
Make sure that your Kubeconfig file does not contains paths to the certificate. Instead it should contain the base64 encoded certificate. For example: When your Kubeconfig file has a field **certificate-authority** with the path to a certificate, you have to replace this field with `certificate-authority-data` and the base64 encoded value of the certificate.

If you want to select your Kubeconfig via the file dialog ensure that the filename has a **.yaml**, **.yml**, **.txt** or **.conf** extension.

Make sure that the Kubeconfig file only contains clusters and users, which are not using a Cloud Provider or OIDC for the cluster access. The import for such Kubeconfig files will fail. Please use one of the available Cloud Providers to import such clusters.
          ''',
        ),
        HelpItem(
          title: 'Google',
          icon: CustomIcons.kubernetes,
          markdown:
              '''
You can directly import your GKA clusters from Google Cloud. To import your GKE clusters you have to provide a valide **Client ID** and **Client Secret** from a Google OAuth 2.0 application. The instructions on how to configure such an application can be found in the following.

### Google OAuth 2.0 Configuration

Login to the [Google Cloud Console](https://console.cloud.google.com) and choose **API & Services** and then **OAuth consent screen** from the menu.

![Google OAuth 2.0 Configuration](resource:assets/help/providers-google-1.png)

Click on **EDIT APP** and add **https://www.googleapis.com/auth/cloud-platform** to the **Scopes for Google APIs** section. Then save your OAuth consent screen.

![Google OAuth 2.0 Configuration](resource:assets/help/providers-google-2.png)

Select the **Credentials** item from the menu to get a new Client ID. Then click on **CREATE CREDENTIALS** and select **OAuth client ID**.

#### Web

Configure a new Web Application client and obtain a **Client ID** and **Client Secret**

You must allow **${Constants.googleRedirectURI}** as a valid redirect url in the settings. Or you specify a custom redirect url while adding the provider. The redirect url should point to a site where you can easily copy the returned **code** parameter, an example html file for such a page can be found at https://github.com/kubenav/kubenav/blob/main/kubenav.io/auth/google.html.

![Google OAuth 2.0 Configuration](resource:assets/help/providers-google-3.png)

#### Activate APIs

In the last step you need to enable the **Kubernetes Engine API** and the **Cloud Resource Manager API**:

- **Kubernetes Engine API:** [https://console.cloud.google.com/apis/library/container.googleapis.com](https://console.cloud.google.com/apis/library/container.googleapis.com)
- **Cloud Resource Manager API:** [https://console.cloud.google.com/apis/library/cloudresourcemanager.googleapis.com](https://console.cloud.google.com/apis/library/cloudresourcemanager.googleapis.com)
          ''',
        ),
        HelpItem(
          title: 'Amazon Web Services',
          icon: CustomIcons.kubernetes,
          markdown: '''
To use the Amazon Web Services provider to import your EKS cluster you have to provide a **Access Key ID**, **Secret Key** and a **Region**.

These credentials are also used to mange the authentication against the Kubernetes API server of your EKS cluster. So make sure that the **Access Key ID** has the rights to get a list of your EKS clusters and to access your cluster.
          ''',
        ),
        HelpItem(
          title: 'AWS Single Sign-On',
          icon: CustomIcons.kubernetes,
          markdown: '''
You can also use AWS Single Sign-On within kubenav, for that you have to provide a **Start URL**, **Account ID**, **Role Name**, **SSO Region** and **Region**.
          ''',
        ),
        HelpItem(
          title: 'Azure',
          icon: CustomIcons.kubernetes,
          markdown: '''
To import your AKS clusters from Microsoft Azure your have to provide some credentials. The instructions on how to get / create these credentials can be found in the following.

### Microsoft Azure: Creating App Credentials

Login to the [Microsoft Azure Portal](https://portal.azure.com/), you need the following information to use the Azure integration for kubenav:

- Subscription ID
- Client ID
- Client Secret
- Tenant ID
- Resource Group Name

To get a Client ID, Client Secret and Tenant ID, you have to create an **App registration**, in the **Azure Active Directory**. For this go to **Azure Active Directory**, **App registrations** and create a **New registration**. You do not need to provide a Redirect URI. After the creation note download the **Application (client) ID** and **Directory (tenant) ID**.

![Microsoft Azure: Creating App Credentials](resource:assets/help/providers-azure-1.png)

Then for this **App registration** go to **Certificates & secrets** and create a new **Client secret**.

![Microsoft Azure: Creating App Credentials](resource:assets/help/providers-azure-2.png)

Then for this **App registration** go to **Manifest** and set **"oAuth2AllowImplicitFlow": true**. Then save the changed manifest.

![Microsoft Azure: Creating App Credentials](resource:assets/help/providers-azure-3.png)

Next you have to give the new **App registration** permissions to manage the above resources. For this go to **Subscriptions**, choose the subscription that you want to use with kubenav, take a note of the **Subscription ID** and then go to **Access control (IAM)** in your subscription.

![Microsoft Azure: Creating App Credentials](resource:assets/help/providers-azure-4.png)

There add a new **Role assignment** between the role **Contributor** and the **Azure AD user, group or service principal** that you just created.

![Microsoft Azure: Creating App Credentials](resource:assets/help/providers-azure-5.png)
          ''',
        ),
        HelpItem(
          title: 'OIDC',
          icon: CustomIcons.kubernetes,
          markdown:
              '''
Provide a **Name**, **Discovery URL** and **Client ID** for your OIDC provider. If you do not select a PKCE method you must also provide a **Client Secret**.

Optionally you can also specify a **Scope**, **Certificate Authority** and **Refresh Token**.

After you provided all the information click on the **Sign In** button and finish the authentication flow. After the authentication flow is finished you will be redirected to **kubenav.io** where you can copy the **Code**.

Finish the provider setup by clicking on **Save and add cluster(s)**

You must allow **${Constants.oidcRedirectURI}** as a valid redirect url in the settings of your OIDC provider. Or you specify a custom redirect url while adding the provider. The redirect url should point to a site where you can easily copy the returned **code** parameter, an example html file for such a page can be found at https://github.com/kubenav/kubenav/blob/main/kubenav.io/auth/oidc.html.
          ''',
        ),
        HelpItem(
          title: 'DigitalOcean',
          icon: CustomIcons.kubernetes,
          markdown: '''
To use the DigitalOcean provider you just need a [Personal Access Token](https://www.digitalocean.com/docs/apis-clis/api/create-personal-access-token/) to access the DigitalOcean API.
          ''',
        ),
        HelpItem(
          title: 'Rancher',
          icon: CustomIcons.kubernetes,
          markdown: '''
To use the Rancher provider you have to provide the **address** of the Rancher API. Ensure that the address doesn't contain a trailing slash ("/"). If you are using a self signed certificate for your Rancher setup, enable the **Allow Insecure Connections** option.

You also have to provide a **username** and **password**. Once these information are provided you can use the **sign in** button to generate a new **token**, optionally you can also provide a token by your own.
          ''',
        ),
        HelpItem(
          title: 'Manual',
          icon: CustomIcons.kubernetes,
          markdown: '''
This method can be used, when you want to manually configure each cluster. If your provider is not supported you can use a **Service Account** to get access to your cluster.

### Use a Service Account

If you haven't a Kubeconfig file which is compatible with kubenav or if your cloud provider isn't supported you can create a Service Account and use these credentials for the authentication.

In the first step you have to create a **ServiceAccount**, **ClusterRole** and **ClusterRoleBinding**. In the following example we create the required resources in a new Namespace named **kubenav**:

```sh
cat <<EOF | kubectl apply -f -
---
apiVersion: v1
kind: Namespace
metadata:
  name: kubenav

---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: kubenav
  namespace: kubenav

---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: kubenav
  namespace: kubenav
rules:
  - apiGroups: ["*"]
    resources: ["*"]
    verbs: ["*"]

---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: kubenav
  namespace: kubenav
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: kubenav
subjects:
  - kind: ServiceAccount
    name: kubenav
    namespace: kubenav
EOF
```

Now we have to use the created secret, which is used by the Service Account. To get the name of the secret run the following command:

```sh
export SECRET_NAME=\$(kubectl get sa --namespace kubenav kubenav -o=jsonpath='{.secrets[*].name}')
```

To get the certificate and access token to authenticate against the Kubernetes API we can run the following:

```sh
kubectl get secret \$SECRET_NAME -o=jsonpath='{.data.ca.crt}' | base64 --decode
kubectl get secret \$SECRET_NAME -o=jsonpath='{.data.token}' | base64 --decode
```

The output from the first command can now be used for the **Certificate Authority Data** field and the output from the second command for the **Token** field.

The specified RBAC rules from the example provide full cluster access wihtout any restrictions. More information can be found in the Kubernets documentation: [Using RBAC Authorization](https://kubernetes.io/docs/reference/access-authn-authz/rbac/).
          ''',
        ),
      ],
    ),
    HelpSection(
      title: 'Namespaces',
      items: [
        HelpItem(
          title: 'Switch between Namespaces',
          icon: CustomIcons.namespaces,
          markdown: '''
You can switch between namespaces by clicking on the **Namespaces** icon on a resources list page.

When you do not have the required permissions you can switch between namespaces by **editing a cluster** or by adding a list of namespaces. You can read the **Add a Namespace** documentation to find out how you can manage a list of namespaces.

![Switch between Namespaces](resource:assets/help/namespaces-switch-namespaces-1.png)
          ''',
        ),
        HelpItem(
          title: 'Add a Namespace',
          icon: CustomIcons.namespaces,
          markdown: '''
You can maintain a list of namespaces, to quickly switch between them. To add a new namespace go to the **Settings** page and select the **Namespaces** item from the **Settings** section.

![Add a Namespace](resource:assets/help/namespaces-add-namespace-1.png)

On the namespaces page select the **Plus** icon in the op right corner.

![Add a Namespace](resource:assets/help/namespaces-add-namespace-2.png)

Then provide the **Name** of the namespace and click **Add Namespace**

![Add a Namespace](resource:assets/help/namespaces-add-namespace-3.png)

You can also use the **star icon** on the details page for a namespace, to add / remove the namespace from the list of namespaces.

![Add a Namespace](resource:assets/help/namespaces-add-namespace-4.png)
          ''',
        ),
        HelpItem(
          title: 'Delete a Namespace',
          icon: CustomIcons.namespaces,
          markdown: '''
To delete a namespace go to **Settings** -> **Namespaces**. Then **click** on the namespace you want to delete. In the opened modal click on **Delete**.

![Delete a Namespace](resource:assets/help/namespaces-delete-namespace-1.png)
          ''',
        ),
        HelpItem(
          title: 'Sort Namespaces',
          icon: CustomIcons.namespaces,
          markdown: '''
To sort the list of namespaces go to **Settings** -> **Namespaces**.

To sort the namespaces you have to **press on the drag handle icon** of the namespace and move it up or down.
          ''',
        ),
      ],
    ),
    HelpSection(
      title: 'Bookmarks',
      items: [
        HelpItem(
          title: 'Add a Bookmark',
          icon: Icons.bookmark,
          markdown: '''
Bookmarks can be used to get faster access to your Kubernetes resources.

Bookmarks can be added from a resources list or details page, by clicking on the **Bookmark** icon.

![Add a Bookmark](resource:assets/help/bookmarks-add-bookmark-1.png)

![Add a Bookmark](resource:assets/help/bookmarks-add-bookmark-2.png)
          ''',
        ),
        HelpItem(
          title: 'Delete a Bookmark',
          icon: Icons.bookmark,
          markdown: '''
Bookmarks can be deleted from a resources list or details page, by clicking on the **Bookmark** icon.

![Delete a Bookmark](resource:assets/help/bookmarks-delete-bookmark-1.png)

![Delete a Bookmark](resource:assets/help/bookmarks-delete-bookmark-2.png)

You can also delete bookmarks by click on **View all** in the **Bookmarks** section. On the bookmarks page you can then **long tap** on a bookmark. In the opened modal click on **Delete**.

![Delete a Bookmark](resource:assets/help/bookmarks-delete-bookmark-3.png)
          ''',
        ),
        HelpItem(
          title: 'Sort Bookmarks',
          icon: Icons.bookmark,
          markdown: '''
You can sort you bookmarks on the **Bookmarks** page.

To sort the bookmarks you have to **press on the drag handle icon** of the bookmark and move it up or down.
          ''',
        ),
      ],
    ),
    HelpSection(
      title: 'Logs, Terminals and Port-Forwarding',
      items: [
        HelpItem(
          title: 'Get Logs of a Container',
          icon: Icons.subject,
          markdown: '''
To get the logs of a container you can click on the **Logs** icon.

![Logs](resource:assets/help/logs-1.png)

In the opened modal select the container and the time range for which you want to view the logs and click on **Get Logs**.

![Logs](resource:assets/help/logs-2.png)

To close the opened terminal with the logs you have to **long tap** on the terminal tab.

![Logs](resource:assets/help/logs-3.png)
          ''',
        ),
        HelpItem(
          title: 'Create a Terminal of a Container',
          icon: Icons.terminal,
          markdown: '''
To get a terminal of a container you can click on the **Terminal** icon.

![Terminals](resource:assets/help/terminals-1.png)

In the opened modal select the container and the shell and click on **Get Terminal**.

![Terminals](resource:assets/help/terminals-2.png)

To close the opened terminal you have to **long tap** on the terminal tab.

![Terminals](resource:assets/help/terminals-3.png)

You can also just close the modal and reopen a terminal via the global **Terminals** button.

![Terminals](resource:assets/help/terminals-4.png)
          ''',
        ),
        HelpItem(
          title: 'Establish a Port-Forwarding Session',
          icon: Icons.link,
          markdown: '''
To get a port-forwarding session to a container select a **Port** in the **Configuration** section.

![Port-Forwarding Session](resource:assets/help/pfs-1.png)

Then wait until the global **Port-Forwarding Sessions** icon is displayed.

![Port-Forwarding Session](resource:assets/help/pfs-2.png)

Select the port-forwarding session you want to use from the opened modal.

![Port-Forwarding Session](resource:assets/help/pfs-3.png)

From there you can open a browser, copy the address or delete the port-forwarding session.

![Port-Forwarding Session](resource:assets/help/pfs-4.png)
          ''',
        ),
      ],
    ),
    HelpSection(
      title: 'Plugins',
      items: [
        HelpItem(
          title: 'Helm',
          icon: Icons.extension,
          markdown: '''
To use the Helm plugin, you must be able to view all secrets in a cluster / namespace.

Besides the required permissions the plugin doesn't require further configuration.
          ''',
        ),
        HelpItem(
          title: 'Prometheus',
          icon: Icons.extension,
          markdown: '''
To use the Prometheus plugin, you have to enable and configure the plugin in the **Settings** -> **Prometheus** menu.

You can use the Prometheus plugin with a public available Prometheus instance or via a Prometheus Pod running inside your cluster.

To use a public available Prometheus instance you have to provide the **Address** field in the configuration. You can also provide a **Username**, **Password** and **Token** in the credentials section.

To use a Prometheus instance running as Pod inside your cluster, the **Address field must be empty**. Instead you can provide a **Namespace**, **Label Selector**, **Container** and **Port** to use a Pod from your cluser. You can also specify an optional **Path** under which the Prometheus API is served from this port. The credentials section can also be used with the in-cluster configuration.
          ''',
        ),
        HelpItem(
          title: 'Prometheus - Custom Metrics',
          icon: Icons.extension,
          markdown: '''
When the Prometheus plugin is enabled, the app will automatically show some important metrics for your workloads within the details page of each workload.

You can also add custom metrics for all resources by adding a `kubenav.io/prometheus` annotation to this resource. In the following we are adding a custom metric to a Deployment to show the number of HTTP requests per response code (which is also used as label) for the deployment:

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp
  namespace: default
  labels:
    app: myapp
  annotations:
    kubenav.io/prometheus: |
      - title: 'HTTP Requests'
        unit: 'req/s'
        queries:
          - label: '{{.response_code}}'
            query: 'sum(irate(istio_requests_total{reporter=~"destination",destination_workload_namespace=~"default",destination_workload=~"myapp"}[5m])) by (response_code)'
spec:
```

![Prometheus - Custom Metric](resource:assets/help/plugins-prometheus-1.png)
          ''',
        ),
        HelpItem(
          title: 'Prometheus - Dashboards',
          icon: Icons.extension,
          markdown: '''
Besides the default metrics and the custom metrics mentioned in the previous help section, it is also possible to define custom Prometheus dashboards.

The dashboards are defined via ConfigMaps with a `kubenav.io/prometheus=dashboard` label and can be accessed via the **Plugins** -> **Prometheus** menu item. The page will then list all ConfigMaps with the mentioned label in the currently selected namespace.

An example ConfigMap for a Prometheus dashboard can be found in the following:

```
apiVersion: v1
kind: ConfigMap
metadata:
  name: mydashboard
  namespace: default
  labels:
    kubenav.io/prometheus: dashboard
data:
  charts: |
    - title: 'HTTP Requests'
      unit: 'req/s'
      queries:
        - label: '{{.response_code}}'
          query: 'sum(irate(istio_requests_total{reporter=~"destination",destination_workload_namespace=~"default",destination_workload=~"myapp"}[5m])) by (response_code)'
```
          ''',
        ),
      ],
    ),
  ];
}
