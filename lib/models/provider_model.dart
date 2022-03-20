/// A [Provider] represents all our Kubernetes cluster providers. The providers are implementing different ways to add a
/// Kubernetes cluster to kubenav. For example a user can add clusters via it's Kubeconfig file or by logging in to his
/// cloud provider and directly adding the clusters via their api.
class Provider {
  String name;
  String title;
  String subtitle;
  String image42x42;
  String image54x54;
  String image250x140;

  Provider({
    required this.name,
    required this.title,
    required this.subtitle,
    required this.image42x42,
    required this.image54x54,
    required this.image250x140,
  });
}

/// [Providers] implements a [list] of providers via our [Provider] model. It contains all providers which can be used
/// to add and interact with a Kubernetes cluster.
abstract class Providers {
  static final kubeconfig = Provider(
    name: 'kubeconfig',
    title: 'Kubeconfig',
    subtitle: 'Import clusters via Kubeconfig',
    image42x42: 'assets/provider/image42x42/kubeconfig42x42.png',
    image54x54: 'assets/provider/image54x54/kubeconfig54x54.png',
    image250x140: 'assets/provider/image250x140/kubeconfig250x140.png',
  );
  // static final gcp = Provider(
  //   name: 'gcp',
  //   title: 'Google Cloud Platform',
  //   subtitle: 'Import your GKE clusters',
  //   image42x42: 'assets/provider/image42x42/gcp42x42.png',
  //   image54x54: 'assets/provider/image54x54/gcp54x54.png',
  //   image250x140: 'assets/provider/image250x140/gcp250x140.png',
  // );
  static final aws = Provider(
    name: 'aws',
    title: 'Amazon Web Services',
    subtitle: 'Import your EKS clusters',
    image42x42: 'assets/provider/image42x42/aws42x42.png',
    image54x54: 'assets/provider/image54x54/aws54x54.png',
    image250x140: 'assets/provider/image250x140/aws250x140.png',
  );
  static final azure = Provider(
    name: 'azure',
    title: 'Azure',
    subtitle: 'Import your AKS clusters',
    image42x42: 'assets/provider/image42x42/azure42x42.png',
    image54x54: 'assets/provider/image54x54/azure54x54.png',
    image250x140: 'assets/provider/image250x140/azure250x140.png',
  );
  static final digitalocean = Provider(
    name: 'digitalocean',
    title: 'Digital Ocean',
    subtitle: 'Import your DOKS clusters',
    image42x42: 'assets/provider/image42x42/digitalocean42x42.png',
    image54x54: 'assets/provider/image54x54/digitalocean54x54.png',
    image250x140: 'assets/provider/image250x140/digitalocean250x140.png',
  );
  // static final awssso = Provider(
  //   name: 'awssso',
  //   title: 'AWS Single Sign-On',
  //   subtitle: 'Import your EKS clusters via AWS SSO',
  //   image42x42: 'assets/provider/image42x42/aws42x42.png',
  //   image54x54: 'assets/provider/image54x54/aws54x54.png',
  //   image250x140: 'assets/provider/image250x140/aws250x140.png',
  // );
  // static final oidc = Provider(
  //   name: 'oidc',
  //   title: 'OIDC',
  //   subtitle: 'OIDC cluster configuration',
  //   image42x42: 'assets/provider/image42x42/oidc42x42.png',
  //   image54x54: 'assets/provider/image54x54/oidc54x54.png',
  //   image250x140: 'assets/provider/image250x140/oidc250x140.png',
  // );
  static final manual = Provider(
    name: 'manual',
    title: 'Manual',
    subtitle: 'Manual cluster configuration',
    image42x42: 'assets/provider/image42x42/manual42x42.png',
    image54x54: 'assets/provider/image54x54/manual54x54.png',
    image250x140: 'assets/provider/image250x140/manual250x140.png',
  );

  static List<Provider> list = [
    kubeconfig,
    aws,
    azure,
    digitalocean,
    manual,
  ];
}
