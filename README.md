# Logger
A utility to disaply log information printed from various packages and the app being developed in the same format

Add this package to any app where you want to see formatted output. The Logger class is a singleton which only allows one package/app to listen to the log stream via `void registerPrinter(void Function(Log))`. Each Log includes a message and an optional `Error` as well as an optional `StackTrace` although this is uncessary because Logger includes a StackTrace by default. 

## To do
1. Add flutter support