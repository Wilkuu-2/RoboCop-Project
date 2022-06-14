# RoboCop-Project
Module 4 Create Y1 2022


## Webcam Integration 
Je moet ofc een webcam inpluggen.
Nadat je de class drin hebt gezet en dat werkt moet de geinitialized worden door in de setup dit te plaatsen:
```
webcam = new Webcam(this);
```
en niet vergeten te initializen met ``` Webcam webcam;``` boven in de sketch.

Daarna kan je een foto maken met:
```
webcam.capture();
```
deze kan je dan laten zien met:
```
image(webcam.cam, 0, 0);
```
