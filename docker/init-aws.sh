#!/bin/bash

aws ses verify-email-identity --email-address no-reply@golsfamilia.com --region us-west-2 --endpoint-url=http://localhost:4566
aws ses verify-email-identity --email-address no-reply@familiaemcampo --region us-west-2 --endpoint-url=http://localhost:4566
