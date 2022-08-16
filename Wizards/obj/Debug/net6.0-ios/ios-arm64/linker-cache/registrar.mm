#define DEBUG 1
#include <xamarin/xamarin.h>
#include "registrar.h"
extern "C" {
static id native_to_managed_trampoline_1 (id self, SEL _cmd, MonoMethod **managed_method_ptr, bool* call_super, uint32_t token_ref)
{
	MonoClass *declaring_type = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [0];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	bool has_nsobject = xamarin_has_nsobject (self, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	if (has_nsobject) {
		*call_super = true;
		goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	declaring_type = mono_method_get_class (managed_method);
	mthis = xamarin_new_nsobject (self, declaring_type, &exception_gchandle);
	xamarin_mono_object_release (&declaring_type);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return self;
}


static void native_to_managed_trampoline_2 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static BOOL native_to_managed_trampoline_3 (id self, SEL _cmd, MonoMethod **managed_method_ptr, struct trampoline_struct_p p0, uint32_t token_ref)
{
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arg_ptrs [0] = &p0;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static Class native_to_managed_trampoline_4 (id self, SEL _cmd, MonoMethod **managed_method_ptr, uint32_t token_ref)
{
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	Class res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [0];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	retval = mono_runtime_invoke (managed_method, NULL, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	if (!retval) {
		res = NULL;
	} else {
		res = (Class) xamarin_get_handle_for_inativeobject (retval, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}

exception_handling:
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static BOOL native_to_managed_trampoline_5 (id self, SEL _cmd, MonoMethod **managed_method_ptr, uint32_t token_ref)
{
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [0];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static void native_to_managed_trampoline_6 (id self, SEL _cmd, MonoMethod **managed_method_ptr, uint32_t token_ref)
{
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [0];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static void native_to_managed_trampoline_7 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoClass *paramclass1 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
		paramclass1 = mono_class_from_mono_type (paramtype1);
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, paramclass1, managed_method);
	}
	arg_ptrs [1] = mobj1;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&paramclass1);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static BOOL native_to_managed_trampoline_8 (id self, SEL _cmd, MonoMethod **managed_method_ptr, NSInteger p0, uint32_t token_ref)
{
	long long nativeEnum0 = p0;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arg_ptrs [0] = &nativeEnum0;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static NSUInteger native_to_managed_trampoline_9 (id self, SEL _cmd, MonoMethod **managed_method_ptr, uint32_t token_ref)
{
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	NSUInteger res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [0];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	res = *(NSUInteger *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static void native_to_managed_trampoline_10 (id self, SEL _cmd, MonoMethod **managed_method_ptr, NSInteger p0, uint32_t token_ref)
{
	long long nativeEnum0 = p0;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arg_ptrs [0] = &nativeEnum0;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static void native_to_managed_trampoline_11 (id self, SEL _cmd, MonoMethod **managed_method_ptr, CGSize p0, id p1, uint32_t token_ref)
{
	MonoObject *inobj1 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arg_ptrs [0] = &p0;
	inobj1 = xamarin_get_inative_object_static (p1, false, 0x8A26 /* UIKit.IUIViewControllerTransitionCoordinator */, 0x8B26 /* UIKit.UIViewControllerTransitionCoordinatorWrapper */, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arg_ptrs [1] = inobj1;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&inobj1);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static void native_to_managed_trampoline_12 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;

	mono_runtime_invoke (managed_method, NULL, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static void native_to_managed_trampoline_13 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, void * p1, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	void * a1 = p1;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &a1;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static BOOL native_to_managed_trampoline_14 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}




#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wprotocol"
#pragma clang diagnostic ignored "-Wobjc-protocol-property-synthesis"
#pragma clang diagnostic ignored "-Wobjc-property-implementation"
@implementation Microsoft_iOS__UIKit_UIApplicationDelegate {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x2C526);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end
#pragma clang diagnostic pop

@interface AppDelegate : NSObject<UIApplicationDelegate, UIApplicationDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) applicationDidFinishLaunching:(UIApplication *)p0;
	-(BOOL) conformsToProtocol:(struct trampoline_struct_p)p0;
	-(id) init;
@end

@implementation AppDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) applicationDidFinishLaunching:(UIApplication *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0xC00);
	}

	-(BOOL) conformsToProtocol:(struct trampoline_struct_p)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x10026);
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xD00);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface iOSGameView : UIView {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	+(Class) layerClass;
	-(BOOL) canBecomeFirstResponder;
	-(void) doTick;
	-(void) layoutSubviews;
	-(void) didMoveToWindow;
	-(void) touchesBegan:(NSSet *)p0 withEvent:(UIEvent *)p1;
	-(void) touchesEnded:(NSSet *)p0 withEvent:(UIEvent *)p1;
	-(void) touchesMoved:(NSSet *)p0 withEvent:(UIEvent *)p1;
	-(void) touchesCancelled:(NSSet *)p0 withEvent:(UIEvent *)p1;
	-(BOOL) conformsToProtocol:(struct trampoline_struct_p)p0;
@end

@implementation iOSGameView {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	+(Class) layerClass
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_4 (self, _cmd, &managed_method, 0xC7402);
	}

	-(BOOL) canBecomeFirstResponder
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0xC7502);
	}

	-(void) doTick
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_6 (self, _cmd, &managed_method, 0xC7902);
	}

	-(void) layoutSubviews
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_6 (self, _cmd, &managed_method, 0xC7E02);
	}

	-(void) didMoveToWindow
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_6 (self, _cmd, &managed_method, 0xC7F02);
	}

	-(void) touchesBegan:(NSSet *)p0 withEvent:(UIEvent *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, p1, 0xC8302);
	}

	-(void) touchesEnded:(NSSet *)p0 withEvent:(UIEvent *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, p1, 0xC8402);
	}

	-(void) touchesMoved:(NSSet *)p0 withEvent:(UIEvent *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, p1, 0xC8502);
	}

	-(void) touchesCancelled:(NSSet *)p0 withEvent:(UIEvent *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, p1, 0xC8602);
	}

	-(BOOL) conformsToProtocol:(struct trampoline_struct_p)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x10026);
	}
@end

@interface Microsoft_Xna_Framework_iOSGameViewController : UIViewController {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) loadView;
	-(BOOL) shouldAutorotateToInterfaceOrientation:(NSInteger)p0;
	-(NSUInteger) supportedInterfaceOrientations;
	-(BOOL) shouldAutorotate;
	-(void) didRotateFromInterfaceOrientation:(NSInteger)p0;
	-(BOOL) prefersStatusBarHidden;
	-(void) viewWillTransitionToSize:(CGSize)p0 withTransitionCoordinator:(id)p1;
	-(NSUInteger) preferredScreenEdgesDeferringSystemGestures;
	-(BOOL) conformsToProtocol:(struct trampoline_struct_p)p0;
@end

@implementation Microsoft_Xna_Framework_iOSGameViewController {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) loadView
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_6 (self, _cmd, &managed_method, 0xCA602);
	}

	-(BOOL) shouldAutorotateToInterfaceOrientation:(NSInteger)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_8 (self, _cmd, &managed_method, p0, 0xCA802);
	}

	-(NSUInteger) supportedInterfaceOrientations
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, 0xCA902);
	}

	-(BOOL) shouldAutorotate
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0xCAA02);
	}

	-(void) didRotateFromInterfaceOrientation:(NSInteger)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_10 (self, _cmd, &managed_method, p0, 0xCAB02);
	}

	-(BOOL) prefersStatusBarHidden
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0xCAC02);
	}

	-(void) viewWillTransitionToSize:(CGSize)p0 withTransitionCoordinator:(id)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_11 (self, _cmd, &managed_method, p0, p1, 0xCAD02);
	}

	-(NSUInteger) preferredScreenEdgesDeferringSystemGestures
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, 0xCAE02);
	}

	-(BOOL) conformsToProtocol:(struct trampoline_struct_p)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x10026);
	}
@end

@interface Foundation_NSDispatcher : NSObject {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) xamarinApplySelector;
	-(BOOL) conformsToProtocol:(struct trampoline_struct_p)p0;
	-(id) init;
@end

@implementation Foundation_NSDispatcher {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) xamarinApplySelector
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_6 (self, _cmd, &managed_method, 0x8126);
	}

	-(BOOL) conformsToProtocol:(struct trampoline_struct_p)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x10026);
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x8026);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface __MonoMac_NSActionDispatcher : Foundation_NSDispatcher {
}
	-(void) xamarinApplySelector;
@end

@implementation __MonoMac_NSActionDispatcher {
}

	-(void) xamarinApplySelector
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_6 (self, _cmd, &managed_method, 0x8326);
	}
@end

@interface __MonoMac_NSSynchronizationContextDispatcher : Foundation_NSDispatcher {
}
	-(void) xamarinApplySelector;
@end

@implementation __MonoMac_NSSynchronizationContextDispatcher {
}

	-(void) xamarinApplySelector
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_6 (self, _cmd, &managed_method, 0x8526);
	}
@end

@interface Foundation_NSAsyncDispatcher : Foundation_NSDispatcher {
}
	-(void) xamarinApplySelector;
	-(id) init;
@end

@implementation Foundation_NSAsyncDispatcher {
}

	-(void) xamarinApplySelector
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_6 (self, _cmd, &managed_method, 0x8726);
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x8626);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Foundation_NSDispatcher class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface __MonoMac_NSAsyncSynchronizationContextDispatcher : Foundation_NSAsyncDispatcher {
}
	-(void) xamarinApplySelector;
@end

@implementation __MonoMac_NSAsyncSynchronizationContextDispatcher {
}

	-(void) xamarinApplySelector
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_6 (self, _cmd, &managed_method, 0x8926);
	}
@end

@interface Foundation_InternalNSNotificationHandler : NSObject {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) post:(NSNotification *)p0;
	-(BOOL) conformsToProtocol:(struct trampoline_struct_p)p0;
@end

@implementation Foundation_InternalNSNotificationHandler {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) post:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0xBE26);
	}

	-(BOOL) conformsToProtocol:(struct trampoline_struct_p)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x10026);
	}
@end

@interface __NSObject_Disposer : NSObject {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	+(void) drain:(NSObject *)p0;
	-(BOOL) conformsToProtocol:(struct trampoline_struct_p)p0;
	-(id) init;
@end

@implementation __NSObject_Disposer {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	+(void) drain:(NSObject *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_12 (self, _cmd, &managed_method, p0, 0x11C26);
	}

	-(BOOL) conformsToProtocol:(struct trampoline_struct_p)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x10026);
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x11A26);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface UIKit_UIAlertView__UIAlertViewDelegate : NSObject<UIAlertViewDelegate, UIAlertViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) alertViewCancel:(UIAlertView *)p0;
	-(void) alertView:(UIAlertView *)p0 clickedButtonAtIndex:(void *)p1;
	-(void) alertView:(UIAlertView *)p0 didDismissWithButtonIndex:(void *)p1;
	-(void) didPresentAlertView:(UIAlertView *)p0;
	-(BOOL) alertViewShouldEnableFirstOtherButton:(UIAlertView *)p0;
	-(void) alertView:(UIAlertView *)p0 willDismissWithButtonIndex:(void *)p1;
	-(void) willPresentAlertView:(UIAlertView *)p0;
	-(BOOL) conformsToProtocol:(struct trampoline_struct_p)p0;
@end

@implementation UIKit_UIAlertView__UIAlertViewDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) alertViewCancel:(UIAlertView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x23D26);
	}

	-(void) alertView:(UIAlertView *)p0 clickedButtonAtIndex:(void *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_13 (self, _cmd, &managed_method, p0, p1, 0x23E26);
	}

	-(void) alertView:(UIAlertView *)p0 didDismissWithButtonIndex:(void *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_13 (self, _cmd, &managed_method, p0, p1, 0x23F26);
	}

	-(void) didPresentAlertView:(UIAlertView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x24026);
	}

	-(BOOL) alertViewShouldEnableFirstOtherButton:(UIAlertView *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_14 (self, _cmd, &managed_method, p0, 0x24126);
	}

	-(void) alertView:(UIAlertView *)p0 willDismissWithButtonIndex:(void *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_13 (self, _cmd, &managed_method, p0, p1, 0x24226);
	}

	-(void) willPresentAlertView:(UIAlertView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, 0x24326);
	}

	-(BOOL) conformsToProtocol:(struct trampoline_struct_p)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x10026);
	}
@end

	static MTClassMap __xamarin_class_map [] = {
		{ NULL, 0x2D26 /* #0 'NSObject' => 'Foundation.NSObject, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x7826 /* #1 'Microsoft_iOS__UIKit_UIApplicationDelegate' => 'UIKit.UIApplicationDelegate, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x400 /* #2 'AppDelegate' => 'Wizards.Program, Wizards' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x8126 /* #3 'UIResponder' => 'UIKit.UIResponder, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x6E26 /* #4 'UIView' => 'UIKit.UIView, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1B902 /* #5 'iOSGameView' => 'Microsoft.Xna.Framework.iOSGameView, MonoGame.Framework' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x7026 /* #6 'UIViewController' => 'UIKit.UIViewController, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1BC02 /* #7 'Microsoft_Xna_Framework_iOSGameViewController' => 'Microsoft.Xna.Framework.iOSGameViewController, MonoGame.Framework' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x426 /* #8 'EAGLContext' => 'OpenGLES.EAGLContext, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x626 /* #9 'EAGLSharegroup' => 'OpenGLES.EAGLSharegroup, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xA26 /* #10 'MPMediaEntity' => 'MediaPlayer.MPMediaEntity, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x726 /* #11 'MPMediaItem' => 'MediaPlayer.MPMediaItem, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x826 /* #12 'MPMediaItemArtwork' => 'MediaPlayer.MPMediaItemArtwork, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x926 /* #13 'MPMediaQuery' => 'MediaPlayer.MPMediaQuery, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xB26 /* #14 'MPMediaItemCollection' => 'MediaPlayer.MPMediaItemCollection, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xD26 /* #15 'MPMoviePlayerController' => 'MediaPlayer.MPMoviePlayerController, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xE26 /* #16 'MPMoviePlayerViewController' => 'MediaPlayer.MPMoviePlayerViewController, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1126 /* #17 'GCController' => 'GameController.GCController, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1526 /* #18 'GCControllerElement' => 'GameController.GCControllerElement, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1226 /* #19 'GCControllerAxisInput' => 'GameController.GCControllerAxisInput, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1326 /* #20 'GCControllerButtonInput' => 'GameController.GCControllerButtonInput, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1426 /* #21 'GCControllerDirectionPad' => 'GameController.GCControllerDirectionPad, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1926 /* #22 'GCPhysicalInputProfile' => 'GameController.GCPhysicalInputProfile, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1726 /* #23 'GCExtendedGamepad' => 'GameController.GCExtendedGamepad, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1826 /* #24 'GCGamepad' => 'GameController.GCGamepad, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1D26 /* #25 'Foundation_NSDispatcher' => 'Foundation.NSDispatcher, Microsoft.iOS' */, (MTTypeFlags) (2) /* UserType */ },
		{ NULL, 0x1E26 /* #26 '__MonoMac_NSActionDispatcher' => 'Foundation.NSActionDispatcher, Microsoft.iOS' */, (MTTypeFlags) (2) /* UserType */ },
		{ NULL, 0x1F26 /* #27 '__MonoMac_NSSynchronizationContextDispatcher' => 'Foundation.NSSynchronizationContextDispatcher, Microsoft.iOS' */, (MTTypeFlags) (2) /* UserType */ },
		{ NULL, 0x2026 /* #28 'Foundation_NSAsyncDispatcher' => 'Foundation.NSAsyncDispatcher, Microsoft.iOS' */, (MTTypeFlags) (2) /* UserType */ },
		{ NULL, 0x2126 /* #29 '__MonoMac_NSAsyncSynchronizationContextDispatcher' => 'Foundation.NSAsyncSynchronizationContextDispatcher, Microsoft.iOS' */, (MTTypeFlags) (2) /* UserType */ },
		{ NULL, 0x2226 /* #30 'NSArray' => 'Foundation.NSArray, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x2326 /* #31 'NSBundle' => 'Foundation.NSBundle, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x2626 /* #32 'NSError' => 'Foundation.NSError, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x2726 /* #33 'Foundation_InternalNSNotificationHandler' => 'Foundation.InternalNSNotificationHandler, Microsoft.iOS' */, (MTTypeFlags) (2) /* UserType */ },
		{ NULL, 0x2B26 /* #34 'NSNull' => 'Foundation.NSNull, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x3926 /* #35 'NSValue' => 'Foundation.NSValue, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x2C26 /* #36 'NSNumber' => 'Foundation.NSNumber, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x3326 /* #37 'NSRunLoop' => 'Foundation.NSRunLoop, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x3726 /* #38 'NSString' => 'Foundation.NSString, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x3826 /* #39 'NSURL' => 'Foundation.NSUrl, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x3D26 /* #40 'NSAutoreleasePool' => 'Foundation.NSAutoreleasePool, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x3F26 /* #41 'NSEnumerator' => 'Foundation.NSEnumerator, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x4026 /* #42 'NSException' => 'Foundation.NSException, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x4126 /* #43 'NSNotification' => 'Foundation.NSNotification, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x4226 /* #44 'NSOperationQueue' => 'Foundation.NSOperationQueue, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x4B26 /* #45 'CMLogItem' => 'CoreMotion.CMLogItem, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x4826 /* #46 'CMAccelerometerData' => 'CoreMotion.CMAccelerometerData, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x4A26 /* #47 'CMDeviceMotion' => 'CoreMotion.CMDeviceMotion, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x4C26 /* #48 'CMMotionManager' => 'CoreMotion.CMMotionManager, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x5F26 /* #49 'CALayer' => 'CoreAnimation.CALayer, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x6026 /* #50 'CADisplayLink' => 'CoreAnimation.CADisplayLink, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x6126 /* #51 'Microsoft_iOS__CoreAnimation_CALayerDelegate' => 'CoreAnimation.CALayerDelegate, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x6226 /* #52 'CAEAGLLayer' => 'CoreAnimation.CAEAGLLayer, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x6626 /* #53 'UIApplication' => 'UIKit.UIApplication, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x6726 /* #54 'UIControl' => 'UIKit.UIControl, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x6826 /* #55 'UIDevice' => 'UIKit.UIDevice, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x6926 /* #56 'UIEvent' => 'UIKit.UIEvent, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x6A26 /* #57 'UIImage' => 'UIKit.UIImage, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x6C26 /* #58 'UIScreen' => 'UIKit.UIScreen, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x6D26 /* #59 'UITextField' => 'UIKit.UITextField, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x7226 /* #60 'UIWindow' => 'UIKit.UIWindow, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x8526 /* #61 'UITouch' => 'UIKit.UITouch, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x9126 /* #62 'AVPlayer' => 'AVFoundation.AVPlayer, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x2426 /* #63 'NSDictionary' => 'Foundation.NSDictionary, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x2826 /* #64 'NSNotificationCenter' => 'Foundation.NSNotificationCenter, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x3126 /* #65 '__NSObject_Disposer' => 'Foundation.NSObject+NSObject_Disposer, Microsoft.iOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x3526 /* #66 'NSSet' => 'Foundation.NSSet, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x6426 /* #67 'UIKit_UIAlertView__UIAlertViewDelegate' => 'UIKit.UIAlertView+_UIAlertViewDelegate, Microsoft.iOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6326 /* #68 'UIAlertView' => 'UIKit.UIAlertView, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x8E26 /* #69 'AVAudioSession' => 'AVFoundation.AVAudioSession, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x9226 /* #70 'AVPlayerItem' => 'AVFoundation.AVPlayerItem, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0 },
	};

	static const char *__xamarin_registration_assemblies []= {
		"Wizards", 
		"MonoGame.Framework", 
		"System.Collections.Concurrent", 
		"System.Collections", 
		"System.ComponentModel.TypeConverter", 
		"System.ComponentModel", 
		"System.Console", 
		"System.Drawing.Primitives", 
		"System.Linq", 
		"System.Numerics.Vectors", 
		"System.Private.Uri", 
		"System.Runtime.InteropServices", 
		"System.Runtime.Serialization.Primitives", 
		"System.Runtime", 
		"System.Text.Encoding.Extensions", 
		"System.Text.RegularExpressions", 
		"System.Threading.Thread", 
		"System.Threading", 
		"System.Private.CoreLib", 
		"Microsoft.iOS"
	};

	static const MTProtocolWrapperMap __xamarin_protocol_wrapper_map [] = {
		{ 0x7526 /* UIKit.IUIAlertViewDelegate */, 0x7626 /* UIAlertViewDelegateWrapper */ },
		{ 0x8A26 /* UIKit.IUIViewControllerTransitionCoordinator */, 0x8B26 /* UIViewControllerTransitionCoordinatorWrapper */ },
		{ 0x8C26 /* UIKit.IUIViewControllerTransitionCoordinatorContext */, 0x8D26 /* UIViewControllerTransitionCoordinatorContextWrapper */ },
	};

	static struct MTRegistrationMap __xamarin_registration_map = {
		__xamarin_registration_assemblies,
		__xamarin_class_map,
		NULL,
		NULL,
		__xamarin_protocol_wrapper_map,
		{ NULL, NULL },
		20,
		71,
		0,
		0,
		3,
		0
	};

void xamarin_create_classes () {
	__xamarin_class_map [0].handle = objc_getClass ("NSObject");
	__xamarin_class_map [1].handle = objc_getClass ("Microsoft_iOS__UIKit_UIApplicationDelegate");
	__xamarin_class_map [2].handle = [AppDelegate class];
	__xamarin_class_map [3].handle = objc_getClass ("UIResponder");
	__xamarin_class_map [4].handle = objc_getClass ("UIView");
	__xamarin_class_map [5].handle = [iOSGameView class];
	__xamarin_class_map [6].handle = objc_getClass ("UIViewController");
	__xamarin_class_map [7].handle = [Microsoft_Xna_Framework_iOSGameViewController class];
	__xamarin_class_map [8].handle = objc_getClass ("EAGLContext");
	__xamarin_class_map [9].handle = objc_getClass ("EAGLSharegroup");
	__xamarin_class_map [10].handle = objc_getClass ("MPMediaEntity");
	__xamarin_class_map [11].handle = objc_getClass ("MPMediaItem");
	__xamarin_class_map [12].handle = objc_getClass ("MPMediaItemArtwork");
	__xamarin_class_map [13].handle = objc_getClass ("MPMediaQuery");
	__xamarin_class_map [14].handle = objc_getClass ("MPMediaItemCollection");
	__xamarin_class_map [15].handle = objc_getClass ("MPMoviePlayerController");
	__xamarin_class_map [16].handle = objc_getClass ("MPMoviePlayerViewController");
	__xamarin_class_map [17].handle = objc_getClass ("GCController");
	__xamarin_class_map [18].handle = objc_getClass ("GCControllerElement");
	__xamarin_class_map [19].handle = objc_getClass ("GCControllerAxisInput");
	__xamarin_class_map [20].handle = objc_getClass ("GCControllerButtonInput");
	__xamarin_class_map [21].handle = objc_getClass ("GCControllerDirectionPad");
	__xamarin_class_map [22].handle = objc_getClass ("GCPhysicalInputProfile");
	__xamarin_class_map [23].handle = objc_getClass ("GCExtendedGamepad");
	__xamarin_class_map [24].handle = objc_getClass ("GCGamepad");
	__xamarin_class_map [25].handle = objc_getClass ("Foundation_NSDispatcher");
	__xamarin_class_map [26].handle = objc_getClass ("__MonoMac_NSActionDispatcher");
	__xamarin_class_map [27].handle = objc_getClass ("__MonoMac_NSSynchronizationContextDispatcher");
	__xamarin_class_map [28].handle = objc_getClass ("Foundation_NSAsyncDispatcher");
	__xamarin_class_map [29].handle = objc_getClass ("__MonoMac_NSAsyncSynchronizationContextDispatcher");
	__xamarin_class_map [30].handle = objc_getClass ("NSArray");
	__xamarin_class_map [31].handle = objc_getClass ("NSBundle");
	__xamarin_class_map [32].handle = objc_getClass ("NSError");
	__xamarin_class_map [33].handle = objc_getClass ("Foundation_InternalNSNotificationHandler");
	__xamarin_class_map [34].handle = objc_getClass ("NSNull");
	__xamarin_class_map [35].handle = objc_getClass ("NSValue");
	__xamarin_class_map [36].handle = objc_getClass ("NSNumber");
	__xamarin_class_map [37].handle = objc_getClass ("NSRunLoop");
	__xamarin_class_map [38].handle = objc_getClass ("NSString");
	__xamarin_class_map [39].handle = objc_getClass ("NSURL");
	__xamarin_class_map [40].handle = objc_getClass ("NSAutoreleasePool");
	__xamarin_class_map [41].handle = objc_getClass ("NSEnumerator");
	__xamarin_class_map [42].handle = objc_getClass ("NSException");
	__xamarin_class_map [43].handle = objc_getClass ("NSNotification");
	__xamarin_class_map [44].handle = objc_getClass ("NSOperationQueue");
	__xamarin_class_map [45].handle = objc_getClass ("CMLogItem");
	__xamarin_class_map [46].handle = objc_getClass ("CMAccelerometerData");
	__xamarin_class_map [47].handle = objc_getClass ("CMDeviceMotion");
	__xamarin_class_map [48].handle = objc_getClass ("CMMotionManager");
	__xamarin_class_map [49].handle = objc_getClass ("CALayer");
	__xamarin_class_map [50].handle = objc_getClass ("CADisplayLink");
	__xamarin_class_map [51].handle = objc_getClass ("Microsoft_iOS__CoreAnimation_CALayerDelegate");
	__xamarin_class_map [52].handle = objc_getClass ("CAEAGLLayer");
	__xamarin_class_map [53].handle = objc_getClass ("UIApplication");
	__xamarin_class_map [54].handle = objc_getClass ("UIControl");
	__xamarin_class_map [55].handle = objc_getClass ("UIDevice");
	__xamarin_class_map [56].handle = objc_getClass ("UIEvent");
	__xamarin_class_map [57].handle = objc_getClass ("UIImage");
	__xamarin_class_map [58].handle = objc_getClass ("UIScreen");
	__xamarin_class_map [59].handle = objc_getClass ("UITextField");
	__xamarin_class_map [60].handle = objc_getClass ("UIWindow");
	__xamarin_class_map [61].handle = objc_getClass ("UITouch");
	__xamarin_class_map [62].handle = objc_getClass ("AVPlayer");
	__xamarin_class_map [63].handle = objc_getClass ("NSDictionary");
	__xamarin_class_map [64].handle = objc_getClass ("NSNotificationCenter");
	__xamarin_class_map [65].handle = objc_getClass ("__NSObject_Disposer");
	__xamarin_class_map [66].handle = objc_getClass ("NSSet");
	__xamarin_class_map [67].handle = objc_getClass ("UIKit_UIAlertView__UIAlertViewDelegate");
	__xamarin_class_map [68].handle = objc_getClass ("UIAlertView");
	__xamarin_class_map [69].handle = objc_getClass ("AVAudioSession");
	__xamarin_class_map [70].handle = objc_getClass ("AVPlayerItem");
	xamarin_add_registration_map (&__xamarin_registration_map, false);
}


} /* extern "C" */
