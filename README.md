## anolson.org

Cloudflare resources for https://anolson.org

## Notes

Generate API key in the Cloudflare dashboard and set the following env vars:

* CLOUDFLARE_KEY
* CLOUDFLARE_EMAIL
* CLOUDFLARE_ACCT_ID

### Export current records

```
$ go get -u github.com/cloudflare/cf-terraforming/...
$ cf-terraforming record \
  --email $CLOUDFLARE_EMAIL \
  --token $CLOUDFLARE_TOKEN \
  --account $CLOUDFLARE_ACCT_ID \
  -z=anolson.org > records.tf
```

### Import zone and records into Terraform

```
$ terraform import cloudflare_zone.anolson_org <zone_id>
$ terraform import cloudflare_record.CNAME_anolson_org <zone_id>/<record_id>
$ terraform import cloudflare_record.CNAME_www_anolson_org <zone_id>/<record_id>
```
