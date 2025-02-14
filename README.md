## 0xcacti's Personal Website 

This website was previously written in React, but 
I disliked it so much that I never really wanted to 
actually do anything.  Thus, it languished as a 
simple singe page website with no functionality.

Recently, I started learning lisp.  I really just wanted to 
do it for fun.  Still, I couldn't think up any fun projects to build in 
lisp. I just didn't know what I could even use lisp for. As I got better, 
however, I realized I can do whatever I want in lisp and it will be awesome. 
Then, I remembered that my website sux. 
So I decided to re-write it using Common Lisp using HTMX, and boom, this weird project was born.


### Hosting 

To host I decided to just go simple and rent a vps and use systemd. 

Steps: 

1. Initial Setup 

``` 
# Update system
sudo apt update && sudo apt upgrade -y

# Install required packages
sudo apt install -y sbcl nginx certbot python3-certbot-nginx sqlite3

# Install Quicklisp
curl -O https://beta.quicklisp.org/quicklisp.lisp
sbcl --load quicklisp.lisp --eval '(quicklisp-quickstart:install)' --eval '(ql:add-to-init-file)' --quit
```

2. Application Setup 

```
git clone https://github.com/0xcacti/0xcacti.com.git
cd 0xcacti-website

mkdir -p ~/quicklisp/local-projects/
ln -s $(pwd) ~/quicklisp/local-projects/0xcacti-website

sbcl --load "scripts/setup-db.lisp"
```

