<?php

$env = getenv();

/* App mode */
if (!isset($env["APP_MODE"])) $env["APP_MODE"] = "dev";

/* Enable metrika */
if (!isset($env["METRIKA"])) $env["METRIKA"] = false;

$env["X-ROUTE-PREFIX"] = "";
$env["X-LAYER-UID"] = "";
$env["X-SPACE-ID"] = "";

return $env;