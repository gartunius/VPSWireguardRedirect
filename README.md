VPS Wireguard Redirect
----

This container exists to be a stable solution to redirecting traffic from a VPS, in my case a Linode box, to a home server connected on the same Wireguard VPN.

It does this by adding some ip tables rules, all you need to do(when the image is ready) is to provide the wireguard files(or keys) to the conatiner so that it can make the connection, and bind the ports 80 and 443.
