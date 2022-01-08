<h1 align="center">
  Bash library
</h1></div>

-->
     update 1.1
<--

```python
Feature :
         1.support all rute
         2.colorama
         3.new color
```


- ### Mulai

pengertian library apa itu library libary adalah sekumpulan fungsi fungsi
yg bisa di kita gunakan di source code kita

cara menggunakan nya sangat simple
langkah peratama kalian wajib menginstall paket yg di butuh kan

```bash
apt-get udate
apt-get full-upgrade
apt-get install curl wget
apt-get install coreutils
apt-get install jq grep gawk
```

jika sudah menginstall paket di atas silakan kalian klone repository ini
menggunakan paket git
```perl
git clone https://github.com/Bayu12345677/library_instagram
```
jika sudah kalian bisa langsung membuka derectory nya
```php
cd library_instagram
```

dan kalian tinggal membuat source di situ

#### cara mengimport module

gunakan `pwd` sebagai lokal patch
untuk mengimport nya kalian bisa menggunakan fungsi
```bash
Bash.import <lokal_patch>/<patch_library>
```

- Contoh
```bash
#!/bin/bash

source "$(pwd)"/lib/moduler.sh

Bash.import "$(pwd)/lib/text_display/string.sh"

Tulis.strN "halo world"
```

### Cara menggunakan library instagram-dl
```bash
#!/bin/bash

source "$(pwd)"/lib/moduler.sh

Bash.import "$(pwd)/lib/instagram-dl/ig-dl.sh"

Bash::mode.dl.ig <url> <nama_video> color: <warna>
```
<br>

- list color
```bash
       red
       green
       yellow
       blue
       magenta
       cyan
       violet
       white
```
<br>

`example usage color`
```bash
Bash.ig-dl <url> <name_video>.mp4 color: <color>
```
<br>
<body>
<p align="center">example ↓
  <img src="https://github.com/Bayu12345677/library_instagram/blob/main/img/Screenshot_20220108-123133~2.png" heigth="15" width="300" alt="logo" border="5">
</p><br>
<p align="center">usage ↓
 <img src="https://github.com/Bayu12345677/library_instagram/blob/main/img/Screenshot_20220108-124727~2.png" width="700" alt="logo" border="5">
</p><br>
<p align="center">result ↓
  <img src="https://github.com/Bayu12345677/library_instagram/blob/main/img/Screenshot_20220108-125103~2.png" with="700" alt="logo" border="5">
</p><br>
</body>

=======================================<br>

- `Donasi` : [Saweria](https://saweria.co/Polygon)

- <Report bug : 6285731184377>
- <Email : bayuriski558@gmail.com>
