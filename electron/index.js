const { app, BrowserWindow, Menu } = require('electron');
const isDevMode = require('electron-is-dev');
const { CapacitorSplashScreen, configCapacitor } = require('@capacitor/electron');

const path = require('path');
const server = require('./server');

// Place holders for our windows so they don't get garbage collected.
let mainWindow = null;

// Placeholder for SplashScreen ref
let splashScreen = null;

// Change this if you do not wish to have a splash screen
let useSplashScreen = false;

// Create simple menu for prod and easy devtools access in dev
const menuTemplateOptionsDev = {
  label: 'Options',
  submenu: [
    { label: 'Open Dev Tools', click() { mainWindow.openDevTools(); }},
    { label: 'Clusters', click: function() { mainWindow.loadURL('http://localhost:14122/settings/clusters'); }},
    { label: 'Info', click: function() { mainWindow.loadURL('http://localhost:14122/settings/info'); }},
    { type: 'separator' },
    { label: 'Quit', accelerator: 'Command+Q', click: function() { app.quit(); }}
  ],
};

const menuTemplateOptionsProd = {
  label: 'Options',
  submenu: [
    { label: 'Clusters', click: function() { mainWindow.loadURL('http://localhost:14122/settings/clusters'); }},
    { label: 'Info', click: function() { mainWindow.loadURL('http://localhost:14122/settings/info'); }},
    { type: 'separator' },
    { label: 'Quit', accelerator: 'Command+Q', click: function() { app.quit(); }}
  ],
};

const menuTemplateEdit = {
  label: 'Edit',
  submenu: [
    { label: 'Undo', accelerator: 'CmdOrCtrl+Z', selector: 'undo:' },
    { label: 'Redo', accelerator: 'Shift+CmdOrCtrl+Z', selector: 'redo:' },
    { type: 'separator' },
    { label: 'Cut', accelerator: 'CmdOrCtrl+X', selector: 'cut:' },
    { label: 'Copy', accelerator: 'CmdOrCtrl+C', selector: 'copy:' },
    { label: 'Paste', accelerator: 'CmdOrCtrl+V', selector: 'paste:' },
    { label: 'Select All', accelerator: 'CmdOrCtrl+A', selector: 'selectAll:' }
  ]
};

const menuTemplateView = {
  label: 'View',
  submenu: [
    {
      label: 'Workloads',
      submenu: [
        { label: 'Cron Jobs', click: function() { mainWindow.loadURL('http://localhost:14122/kubernetes/workloads/cronjobs'); }},
        { label: 'Daemon Sets', click: function() { mainWindow.loadURL('http://localhost:14122/kubernetes/workloads/daemonsets'); }},
        { label: 'Deployments', click: function() { mainWindow.loadURL('http://localhost:14122/kubernetes/workloads/deployments'); }},
        { label: 'Jobs', click: function() { mainWindow.loadURL('http://localhost:14122/kubernetes/workloads/jobs'); }},
        { label: 'Pods', click: function() { mainWindow.loadURL('http://localhost:14122/kubernetes/workloads/pods'); }},
        { label: 'Replica Sets', click: function() { mainWindow.loadURL('http://localhost:14122/kubernetes/workloads/replicasets'); }},
        { label: 'Replication Controllers', click: function() { mainWindow.loadURL('http://localhost:14122/kubernetes/workloads/replicationcontrollers'); }},
        { label: 'Stateful Sets', click: function() { mainWindow.loadURL('http://localhost:14122/kubernetes/workloads/statefulsets'); }},
      ]
    },
    {
      label: 'Discovery and Load Balancing',
      submenu: [
        { label: 'Ingresses', click: function() { mainWindow.loadURL('http://localhost:14122/kubernetes/discovery-and-loadbalancing/ingresses'); }},
        { label: 'Services', click: function() { mainWindow.loadURL('http://localhost:14122/kubernetes/discovery-and-loadbalancing/services'); }},
      ]
    },
    {
      label: 'Config and Storage',
      submenu: [
        { label: 'Config Maps', click: function() { mainWindow.loadURL('http://localhost:14122/kubernetes/config-and-storage/configmaps'); }},
        { label: 'Persistent Volumes', click: function() { mainWindow.loadURL('http://localhost:14122/kubernetes/config-and-storage/persistentvolumes'); }},
        { label: 'Persistent Volume Claims', click: function() { mainWindow.loadURL('http://localhost:14122/kubernetes/config-and-storage/persistentvolumeclaims'); }},
        { label: 'Secrets', click: function() { mainWindow.loadURL('http://localhost:14122/kubernetes/config-and-storage/secrets'); }},
        { label: 'Service Accounts', click: function() { mainWindow.loadURL('http://localhost:14122/kubernetes/config-and-storage/serviceaccounts'); }},
      ]
    },
    {
      label: 'RBAC',
      submenu: [
        { label: 'Cluster Roles', click: function() { mainWindow.loadURL('http://localhost:14122/kubernetes/rbac/clusterroles'); }},
        { label: 'Cluster Role Bindings', click: function() { mainWindow.loadURL('http://localhost:14122/kubernetes/rbac/clusterrolebindings'); }},
        { label: 'Roles', click: function() { mainWindow.loadURL('http://localhost:14122/kubernetes/rbac/roles'); }},
        { label: 'Role Bindings', click: function() { mainWindow.loadURL('http://localhost:14122/kubernetes/rbac/rolebindings'); }},
      ]
    },
    {
      label: 'Cluster',
      submenu: [
        { label: 'Custom Resource Definitions', click: function() { mainWindow.loadURL('http://localhost:14122/kubernetes/cluster/customresourcedefinitions'); }},
        { label: 'Events', click: function() { mainWindow.loadURL('http://localhost:14122/kubernetes/cluster/events'); }},
        { label: 'Namespaces', click: function() { mainWindow.loadURL('http://localhost:14122/kubernetes/cluster/namespaces'); }},
        { label: 'Nodes', click: function() { mainWindow.loadURL('http://localhost:14122/kubernetes/cluster/nodes'); }},
      ]
    },
  ]
};

async function createWindow() {
  // Define our main window size
  mainWindow = new BrowserWindow({
    height: 920,
    width: 1600,
    show: false,
    webPreferences: {
      nodeIntegration: true,
      preload: path.join(__dirname, 'node_modules', '@capacitor', 'electron', 'dist', 'electron-bridge.js')
    }
  });

  configCapacitor(mainWindow);

  mainWindow.webContents.executeJavaScript('localStorage.getItem("clusters");', true).then((result) => {
    const clusters = JSON.parse(result);
    const menuTemplateClusters = { label: 'Clusters', submenu: [] };

    if (clusters) {
      for (let cluster in clusters) {
        menuTemplateClusters.submenu.push({
          label: clusters[cluster].name,
          click: function() {
            mainWindow.webContents.executeJavaScript('localStorage.setItem("cluster", "' + cluster + '");', true).then((data) => {
              mainWindow.loadURL('http://localhost:14122');
            });
          }
        });
      }
    }

    if (isDevMode) {
      // Set our above template to the Menu Object if we are in development mode, dont want users having the devtools.
      Menu.setApplicationMenu(Menu.buildFromTemplate([
        menuTemplateOptionsDev,
        menuTemplateEdit,
        menuTemplateView,
        menuTemplateClusters,
      ]));
      // If we are developers we might as well open the devtools by default.
      mainWindow.webContents.openDevTools();
    } else {
      // Set our above template to the Menu Object if we are in production mode.
      Menu.setApplicationMenu(Menu.buildFromTemplate([
        menuTemplateOptionsProd,
        menuTemplateEdit,
        menuTemplateView,
        menuTemplateClusters,
      ]));
    }
  });

  if (useSplashScreen) {
    splashScreen = new CapacitorSplashScreen(mainWindow);
    splashScreen.init(false);
  } else {
    mainWindow.loadURL('http://localhost:14122/');
    mainWindow.webContents.on('dom-ready', () => {
      mainWindow.show();
    });
  }
}

// This method will be called when Electron has finished
// initialization and is ready to create browser windows.
// Some Electron APIs can only be used after this event occurs.
app.on('ready', function () {
  const listener = server.listen(14122, function() {
    console.log("Server listening on: http://localhost:14122");
  });

  createWindow();
});

// Quit when all windows are closed.
app.on('window-all-closed', function () {
  // On OS X it is common for applications and their menu bar
  // to stay active until the user quits explicitly with Cmd + Q
  if (process.platform !== 'darwin') {
    app.quit();
  }
});

app.on('activate', function () {
  // On OS X it's common to re-create a window in the app when the
  // dock icon is clicked and there are no other windows open.
  if (mainWindow === null) {
    createWindow();
  }
});

// Define any IPC or other custom functionality below here
