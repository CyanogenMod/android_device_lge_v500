#include <pthread.h>

//various funcs we'll need to call, in their mangled form

    //android::String8::String8(char const*)
    extern void _ZN7android7String8C1EPKc(void **str8P, const char *str);

    //android::String8::~String8()
    extern void _ZN7android7String8D1Ev(void **str8P);


//data exports we must provide for camera library to be happy

    /*
     * DATA:     android::Singleton<android::SensorManager>::sLock
     * USE:      INTERPOSE: a mutes that camera lib will insist on accessing
     * NOTES:    In L, the sensor manager exposed this lock that callers
     *           actually locked & unlocked when accessing it. In M this
     *           is no longer the case, but we still must provide it for
     *           the camera library to be happy. It will lock nothing, but
     *           as long as it is a real lock and pthread_mutex_* funcs
     *           work on it, the camera library will be happy.
     */
    pthread_mutex_t _ZN7android9SingletonINS_13SensorManagerEE5sLockE = PTHREAD_MUTEX_INITIALIZER;

    /*
     * DATA:     android::Singleton<android::SensorManager>::sInstance
     * USE:      INTERPOSE: a singleton instance of SensorManager
     * NOTES:    In L, the sensor manager exposed this variable, as it was
     *           a singleton and one could just access this directly to get
     *           the current already-existing instance if it happened to
     *           already exist. If not one would create one and store it
     *           there. In M this is entirely different, but the camera library
     *           does not know that. So we'll init it to NULL to signify that
     *           no current instance exists, let it create one, and store it
     *           here, and upon unloading we'll clean it up, if it is not
     *           NULL (which is what it would be if the camera library itself
     *           did the cleanup).
     */
    void* _ZN7android9SingletonINS_13SensorManagerEE9sInstanceE = NULL;


/*
 * FUNCTION: android::SensorManager::SensorManager(void)
 * USE:      INTERPOSE: construct a sensor manager object
 * NOTES:    This constructor no longer exists in M, instead now one must pass
 *           in a package name as a "string16" to the consrtuctor. Since this
 *           lib only services camera library, it is easy for us to just do that
 *           and this provide the constructor that the camera library wants.
 *           The package name we use if "camera.msm8960". Why not?
 */
void _ZN7android13SensorManagerC1Ev()
{
    void *string;
}

/*
 * FUNCTION: android::SensorManager::createEventQueue(void)
 * USE:      INTERPOSE: create an event queue to receive events
 * NOTES:    This function no longer exists in M, instead now one must pass
 *           in a client name as a "string8" and an integer "mode" to it. M
 *           sources list default values for these params as an empty string
 *           and 0. So we'll craft the same call here.
 */
void _ZN7android13SensorManager16createEventQueueEv()
{
    void *string;

    _ZN7android7String8C1EPKc(&string, "");
    _ZN7android7String8D1Ev(&string);
}
