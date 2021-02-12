# sfpg-docker
Single File PHP Gallery for Docker. This container exposes an instance of SFPG to which a folder with images on the host should be linked. The container internally exposes port 80 and offers no HTTPS support.

This software is not freely usable in a commercial setting, see the author's webpage for the license terms.

## SFPG author
https://sye.dk/sfpg/

## Usage
`docker run -p 4000:80 -v /home/me/Pictures:/var/www/html/images tobias2/sfpg`
