#!/bin/bash


b2 authorize_account "$B2_ACCOUNT_ID" "$B2_APPLICATION_KEY"
$@
