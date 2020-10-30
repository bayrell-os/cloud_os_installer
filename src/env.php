<?php

$env = getenv();

/* App mode */
if (!isset($env["APP_MODE"])) $env["APP_MODE"] = "dev";

/* Enable metrika */
if (!isset($env["METRIKA"])) $env["METRIKA"] = false;

$env["X-ROUTE-PREFIX"] = "";
$env["X-LAYER-UID"] = "";
$env["X-SPACE-ID"] = "";

/* Set auth params */
if (!isset($env["AUTH_PRIVATE_KEY"])) $env["AUTH_PRIVATE_KEY"] = file_get_contents("/run/secrets/AUTH_PRIVATE_KEY");
if (!isset($env["AUTH_PUBLIC_KEY"])) $env["AUTH_PUBLIC_KEY"] = file_get_contents("/run/secrets/AUTH_PUBLIC_KEY");

return $env;