#import <MtProtoKit/MTLogging.h>

static void (*loggingFunction)(const char *, const char *, int, NSString *, va_list args) = NULL;
static void (*shortLoggingFunction)(NSString *, va_list args) = NULL;
static bool MTLogEnabledValue = true;

bool MTLogEnabled() {
    return loggingFunction != NULL && MTLogEnabledValue;
}

void __MTLog(const char * filename, const char * functionName, int lineNumber, NSString *format, ...) {
    va_list L;
    va_start(L, format);
    if (loggingFunction != NULL) {
        loggingFunction(filename, functionName, lineNumber, format, L);
    }
    va_end(L);
}

void MTShortLog(NSString *format, ...) {
    va_list L;
    va_start(L, format);
    if (shortLoggingFunction != NULL) {
        shortLoggingFunction(format, L);
    }
    va_end(L);
}

void MTLogSetLoggingFunction(void (*function)(const char *, const char *, int, NSString *, va_list args)) {
    loggingFunction = function;
}

void MTLogSetShortLoggingFunction(void (*function)(NSString *, va_list args)) {
    shortLoggingFunction = function;
}

void MTLogSetEnabled(bool enabled) {
    MTLogEnabledValue = enabled;
}
