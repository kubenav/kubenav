/// A [PortForwardingSession] represents a single port forwarding session. Each port forwarding session requires the
/// [id] of the session and the local [port] which is used.
class PortForwardingSession {
  String id;
  String name;
  String namespace;
  String container;
  int remotePort;
  int localPort;

  PortForwardingSession({
    required this.id,
    required this.name,
    required this.namespace,
    required this.container,
    required this.remotePort,
    required this.localPort,
  });

  factory PortForwardingSession.fromJson(Map<String, dynamic> json) =>
      PortForwardingSession(
        id: json['id'],
        name: json['name'],
        namespace: json['namespace'],
        container: json['container'],
        remotePort: json['remotePort'],
        localPort: json['localPort'],
      );
}
