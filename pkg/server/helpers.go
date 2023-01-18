package server

import (
	"strconv"

	corev1 "k8s.io/api/core/v1"
)

func getPodContainerAndPort(pod corev1.Pod, serviceTargetPort string) (string, int64) {
	for _, container := range pod.Spec.Containers {
		for _, port := range container.Ports {
			parsedServiceTargetPort, err := strconv.ParseInt(serviceTargetPort, 10, 64)
			if err == nil {
				if parsedServiceTargetPort == int64(port.ContainerPort) {
					return container.Name, int64(port.ContainerPort)
				}
			} else {
				if serviceTargetPort == port.Name {
					return container.Name, int64(port.ContainerPort)
				}
			}
		}
	}

	return "", 0
}
