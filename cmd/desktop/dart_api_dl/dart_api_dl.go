package dart_api_dl

// #include <stdlib.h>
// #include "stdint.h"
// #include "include/dart_api_dl.c"
//
// bool GoDart_PostCObject(Dart_Port_DL port, Dart_CObject* obj) {
//   return Dart_PostCObject_DL(port, obj);
// }
import "C"

import (
	"unsafe"
)

func Init(api unsafe.Pointer) {
	if C.Dart_InitializeApiDL(api) != 0 {
		panic("Failed to initialize Dart DL C API: Version mismatch. Must update \"include/\" to match Dart SDK version")
	}
}

func SendToPort(port int64, data string) {
	ret := C.CString(data)

	var obj C.Dart_CObject
	obj._type = C.Dart_CObject_kString

	// cgo does not support unions so we are forced to do this
	*(**C.char)(unsafe.Pointer(&obj.value)) = ret
	C.GoDart_PostCObject(C.int64_t(port), &obj)

	C.free(unsafe.Pointer(ret))
}
