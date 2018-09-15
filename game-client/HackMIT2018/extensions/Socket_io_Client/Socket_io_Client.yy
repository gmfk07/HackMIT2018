{
    "id": "2d4b2008-cc05-4b52-a0bd-394c5e128574",
    "modelName": "GMExtension",
    "mvc": "1.0",
    "name": "Socket_io_Client",
    "IncludedResources": [
        "Scripts\\Socket.io Client\\socket_get_queue",
        "Scripts\\Socket.io Client\\socket_update"
    ],
    "androidPermissions": [
        
    ],
    "androidProps": false,
    "androidactivityinject": "",
    "androidclassname": "",
    "androidinject": "",
    "androidmanifestinject": "",
    "androidsourcedir": "",
    "author": "",
    "classname": "",
    "copyToTargets": -1,
    "date": "2018-46-15 01:09:46",
    "description": "",
    "extensionName": "",
    "files": [
        {
            "id": "99ece111-d729-4de1-bd44-9a3998431e5e",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 98336,
            "filename": "socket.io-1.4.5.js",
            "final": "",
            "functions": [
                
            ],
            "init": "",
            "kind": 5,
            "order": [
                
            ],
            "origname": "extensions\\socket.io-1.4.5.js",
            "uncompress": false
        },
        {
            "id": "3528a4a6-6887-4077-8634-c58f52c36f32",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 98336,
            "filename": "gmsocket.io.js",
            "final": "",
            "functions": [
                {
                    "id": "e1293ded-48f2-4ca2-a50b-b1e03910d4db",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "connect",
                    "help": "socket_connect(ip, port)",
                    "hidden": false,
                    "kind": 11,
                    "name": "socket_connect",
                    "returnType": 2
                },
                {
                    "id": "ad5e88bb-bbe7-45ef-beef-e3b26cd5c455",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "addListener",
                    "help": "socket_add_listener(name, script)",
                    "hidden": false,
                    "kind": 11,
                    "name": "socket_add_listener",
                    "returnType": 2
                },
                {
                    "id": "9552d254-38cc-449d-a25b-b17abef449e9",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "getQueue",
                    "help": "socket_get_queue_internal()",
                    "hidden": false,
                    "kind": 11,
                    "name": "socket_get_queue_internal",
                    "returnType": 1
                },
                {
                    "id": "2494601f-a1cd-42f8-a3fb-5ecdfc801da4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "clearQueue",
                    "help": "socket_clear_queue",
                    "hidden": false,
                    "kind": 11,
                    "name": "socket_clear_queue",
                    "returnType": 2
                },
                {
                    "id": "3417cfeb-ea5d-437a-ac7b-ff8c7731726e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        1
                    ],
                    "externalName": "emit",
                    "help": "socket_emit(name, data)",
                    "hidden": false,
                    "kind": 11,
                    "name": "socket_emit",
                    "returnType": 2
                },
                {
                    "id": "c531c369-6ddf-4a27-a3ce-8fd3dcfc323f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "disconnect",
                    "help": "socket_disconnect()",
                    "hidden": false,
                    "kind": 11,
                    "name": "socket_disconnect",
                    "returnType": 2
                }
            ],
            "init": "",
            "kind": 5,
            "order": [
                
            ],
            "origname": "extensions\\gmsocket.io.js",
            "uncompress": false
        },
        {
            "id": "6f528112-f828-4705-bdde-959a763a5fbf",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 123146089894126,
            "filename": "socket.io LICENSE.txt",
            "final": "",
            "functions": [
                
            ],
            "init": "",
            "kind": 4,
            "order": [
                
            ],
            "origname": "extensions\\socket.io LICENSE.txt",
            "uncompress": false
        },
        {
            "id": "5e58d5ce-3119-49c3-884f-1b62e3d69a78",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 9223372036854775807,
            "filename": "Socket.io Client Documentation v1.0.0.pdf",
            "final": "",
            "functions": [
                
            ],
            "init": "",
            "kind": 4,
            "order": [
                
            ],
            "origname": "extensions\\Socket.io Client Documentation v1.0.0.pdf",
            "uncompress": false
        }
    ],
    "gradleinject": "",
    "helpfile": "",
    "installdir": "",
    "iosProps": false,
    "iosSystemFrameworkEntries": [
        
    ],
    "iosThirdPartyFrameworkEntries": [
        
    ],
    "iosplistinject": "",
    "license": "Free to use, also for commercial games.",
    "maccompilerflags": "",
    "maclinkerflags": "",
    "macsourcedir": "",
    "packageID": "me.ivanfonseca.socketioclient",
    "productID": "623014FF5F9DDE15413D4840EC8536EA",
    "sourcedir": "",
    "tvosProps": false,
    "tvosSystemFrameworkEntries": [
        
    ],
    "tvosThirdPartyFrameworkEntries": [
        
    ],
    "tvosclassname": "",
    "tvosmaccompilerflags": "",
    "tvosmaclinkerflags": "",
    "tvosplistinject": "",
    "version": "1.0.0"
}