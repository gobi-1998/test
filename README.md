# test
---
 name: deploy my code on web server
 hosts: all
 tasks:


            -name: copy of my source code
             copy:


                src: /opt/index.html
                dest: /var/www/html
