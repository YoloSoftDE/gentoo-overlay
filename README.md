# YoloSoft's Gentoo Overlay

For providing specific libraries and applications we need on our system.


## Import our overlay ...

### ... using layman

Simply add our repository by the URL of the `repository.xml`. Since we are not an offical repository, you can not add it only by name.

```
sudo layman -o https://raw.githubusercontent.com/YoloSoftDE/gentoo-overlay/master/repository.xml -f -a yolosoft
```

### ... using /etc/portage/repos.conf

You can create a file for our repository in `/etc/portage/repos.conf` or append to an existing file (just as you wish) the following contents:

```
[yolosoft]
location = /usr/local/overlay/yolosoft
sync-type = git
sync-uri = https://github.com/YoloSoftDE/gentoo-overlay.git
auto-sync = yes
```

After that, each time you sync your portage tree via `emerge --sync` a sync of our repository will be done as well.

## Packages we provide

* [app-editors/codelite](http://codelite.org/) a cross platform C/C++/PHP IDE written in C++.
* [sys-apps/vusb-analyzer](http://vusb-analyzer.sourceforge.net) a graphical tool for browsing traces of captured USB data
