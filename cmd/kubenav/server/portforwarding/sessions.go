package portforwarding

import (
	"sync"
)

// Sessions holds all active port forwarding sessions.
var Sessions = SessionMap{Sessions: make(map[string]*Session)}

// SessionMap stores a map of all PortForwardSession objects and a lock to avoid
// concurrent conflict.
type SessionMap struct {
	Sessions map[string]*Session
	Lock     sync.RWMutex
}

// Get return a given portForwardSession by sessionID.
func (sm *SessionMap) Get(sessionID string) (*Session, bool) {
	sm.Lock.RLock()
	defer sm.Lock.RUnlock()

	session, ok := sm.Sessions[sessionID]
	return session, ok
}

// Set store a PortForwardSession to SessionMap.
func (sm *SessionMap) Set(sessionID string, session *Session) {
	sm.Lock.Lock()
	defer sm.Lock.Unlock()

	sm.Sessions[sessionID] = session
}

// Delete removes a session from the active sessions.
func (sm *SessionMap) Delete(sessionID string) {
	sm.Lock.Lock()
	defer sm.Lock.Unlock()

	delete(sm.Sessions, sessionID)
}
