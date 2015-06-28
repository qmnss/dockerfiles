#!/bin/bash
docker run -dit -p=7777:7777 -v /var/lib/terraria/logs:/opt/terraria/logs -v /var/lib/terraria/worlds:/opt/terraria/worlds -v /var/lib/terraria/config:/opt/terraria/config rylee/terraria-tshock
