#import <NetworkLogging/NetworkLogging.h>

#import <Foundation/Foundation.h>
#import <MtProtoKit/MtLogging.h>

static void (*bridgingTrace)(NSString *, NSString *, NSString *, NSString *, int);
void setBridgingTraceFunction(void (*f)(NSString *, NSString *, NSString *, NSString *, int)) {
    bridgingTrace = f;
}

static void (*bridgingShortTrace)(NSString *, NSString *);
void setBridgingShortTraceFunction(void (*f)(NSString *, NSString *)) {
    bridgingShortTrace = f;
}

static void TGTelegramLoggingFunction(const char * filename, const char * functionName, int lineNumber, NSString *format, va_list args) {
    if (bridgingTrace) {
        bridgingTrace(
                      @"MT",
                      [[NSString alloc] initWithFormat:format arguments:args],
                      [[NSString alloc] initWithBytesNoCopy:filename length:strlen(filename) encoding:NSUTF8StringEncoding freeWhenDone:NO],
                      [[NSString alloc] initWithBytesNoCopy:functionName length:strlen(functionName) encoding:NSUTF8StringEncoding freeWhenDone:NO],
                      lineNumber
                      );
    }
}

static void TGTelegramShortLoggingFunction(NSString *format, va_list args) {
    if (bridgingShortTrace) {
        bridgingShortTrace(@"MT", [[NSString alloc] initWithFormat:format arguments:args]);
    }
}

void NetworkRegisterLoggingFunction() {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        MTLogSetLoggingFunction(&TGTelegramLoggingFunction);
        MTLogSetShortLoggingFunction(&TGTelegramShortLoggingFunction);
    });
}

void NetworkSetLoggingEnabled(bool value) {
    MTLogSetEnabled(value);
}
