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
    Provider(
      name: 'manual',
      title: 'Manual',
      subtitle: 'Manual cluster configuration',
      image54x54: 'assets/provider/image54x54/manual54x54.png',
      image250x140: 'assets/provider/image250x140/manual250x140.png',
    ),
  ];
}
