

#ifndef MTLogging_H
#define MTLogging_H

#import <Foundation/Foundation.h>

#ifdef __cplusplus
extern "C" {
#endif

bool MTLogEnabled();
void __MTLog(const char *filename, const char * functionName, int lineNumber, NSString *format, ...);
void MTShortLog(NSString *format, ...);
void MTLogSetLoggingFunction(void (*function)(const char *, const char *, int, NSString *, va_list args));
void MTLogSetShortLoggingFunction(void (*function)(NSString *, va_list args));
void MTLogSetEnabled(bool);

#define MTLog(format, ...) __MTLog(__FILE__, __FUNCTION__, __LINE__, format, ##__VA_ARGS__)

#ifdef __cplusplus
}
#endif

#endif
