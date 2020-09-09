// Package types hold the structs which are shared betweem the different implementations of the Kubernetes API client.
package types

// Cluster implements the cluster type used in the React app.
// This is only needed for the server and Electron implementation. The clusters for the mobile version are saved and
// accessed via the frontend.
type Cluster struct {
	ID                       string `json:"id"`
	Name                     string `json:"name"`
	URL                      string `json:"url"`
	CertificateAuthorityData string `json:"certificateAuthorityData"`
	ClientCertificateData    string `json:"clientCertificateData"`
	ClientKeyData            string `json:"clientKeyData"`
	Token                    string `json:"token"`
	Username                 string `json:"username"`
	Password                 string `json:"password"`
	AuthProvider             string `json:"authProvider"`
	Namespace                string `json:"namespace"`
}
