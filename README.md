# YoloSoft's Gentoo Overlay

For providing specific libraries and applications we need on our system.


## Import our overlay ...

### ... using layman

Simply add our repository by the URL of the `repository.xml`. Since we are not an offical repository, you can not add it only by name.

```
sudo layman -o https://raw.githubusercontent.com/YoloSoftDE/gentoo-overlay/master/repository.xml -f -a yolosoft
```

## Packages we provide

* [app-editors/codelite](http://codelite.org/) a cross platform C/C++/PHP IDE written in C++.
* [sys-apps/vusb-analyzer](http://vusb-analyzer.sourceforge.net) a graphical tool for browsing traces of captured USB data
