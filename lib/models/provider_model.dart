/// A [Provider] represents all our Kubernetes cluster providers. The providers are implementing different ways to add a
/// Kubernetes cluster to kubenav. For example a user can add clusters via it's Kubeconfig file or by logging in to his
/// cloud provider and directly adding the clusters via their api.
class Provider {
  String name;
  String title;
  String subtitle;
  String image54x54;
  String image250x140;

  Provider({
    required this.name,
    required this.title,
    required this.subtitle,
    required this.image54x54,
    required this.image250x140,
  });
}

/// [Providers] implements a [list] of providers via our [Provider] model. It contains all providers which can be used
/// to add and interact with a Kubernetes cluster.
abstract class Providers {
  static List<Provider> list = [
    Provider(
      name: 'kubeconfig',
      title: 'Kubeconfig',
      subtitle: 'Import clusters via Kubeconfig',
      image54x54: 'assets/provider/image54x54/kubeconfig54x54.png',
      image250x140: 'assets/provider/image250x140/kubeconfig250x140.png',
    ),
    // Provider(
    //   name: 'gcp',
    //   title: 'Google Cloud Platform',
    //   subtitle: 'Import your GKE clusters',
    //   image54x54: 'assets/provider/image54x54/gcp54x54.png',
    //   image250x140: 'assets/provider/image250x140/gcp250x140.png',
    // ),
    // Provider(
    //   name: 'aws',
    //   title: 'Amazon Web Services',
    //   subtitle: 'Import your EKS clusters',
    //   image54x54: 'assets/provider/image54x54/aws54x54.png',
    //   image250x140: 'assets/provider/image250x140/aws250x140.png',
    // ),
    // Provider(
    //   name: 'azure',
    //   title: 'Azure',
    //   subtitle: 'Import your AKS clusters',
    //   image54x54: 'assets/provider/image54x54/azure54x54.png',
    //   image250x140: 'assets/provider/image250x140/azure250x140.png',
    // ),
    // Provider(
    //   name: 'digitalocean',
    //   title: 'Digital Ocean',
    //   subtitle: 'Import your DOKS clusters',
    //   image54x54: 'assets/provider/image54x54/digitalocean54x54.png',
    //   image250x140: 'assets/provider/image250x140/digitalocean250x140.png',
    // ),
    // Provider(
    //   name: 'awssso',
    //   title: 'AWS Single Sign-On',
    //   subtitle: 'Import your EKS clusters via AWS SSO',
    //   image54x54: 'assets/provider/image54x54/aws54x54.png',
    //   image250x140: 'assets/provider/image250x140/aws250x140.png',
    // ),
    // Provider(
    //   name: 'oidc',
    //   title: 'OIDC',
    //   subtitle: 'OIDC cluster configuration',
    //   image54x54: 'assets/provider/image54x54/oidc54x54.png',
    //   image250x140: 'assets/provider/image250x140/oidc250x140.png',
    // ),
    Provider(
      name: 'manual',
      title: 'Manual',
      subtitle: 'Manual cluster configuration',
      image54x54: 'assets/provider/image54x54/manual54x54.png',
      image250x140: 'assets/provider/image250x140/manual250x140.png',
    ),
  ];
}
