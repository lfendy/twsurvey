#!/bin/sh

# Notes:
#
# -c concurrency
# Number of multiple requests to perform at a time. Default is one request at a time.
#
# -n requests
# Number of requests to perform for the benchmarking session.
# The default is to just perform a single request which usually leads
# to non-representative benchmarking results.
#
# -p POST-file
# File containing data to POST.
#
# -v verbosity
# Set verbosity level - 4 and above prints information on headers,
# 3 and above prints response codes (404, 200, etc.), 2 and above prints warnings and info.
#
# -T content-type
# Content-type header to use for POST data.
#
# -g gnuplot-file
# W rite all measured values out as a 'gnuplot' or TSV (Tab separate values) file.
# The labels are on the first line of the file.
#
# -e csv-file
# Write a Comma separated value (CSV) file which contains for each percentage (from 1% to 100%)
# the time (in milliseconds) it took to serve that percentage of the requests.
# This is usually more useful than the 'gnuplot' file; as the results are already 'binned'.

NUMBER=$1
CONCURRENT=$2
TARGET_URL="http://twsurvey.herokuapp.com/"

if [ -z "$NUMBER" ]; then
  echo "Missing NUMBER of requests to run"
  exit 1
fi

if [ -z "$CONCURRENT" ]; then
  echo "Missing CONCURRENT number of requests to perform at a time"
  exit 1
fi

ab -n $NUMBER -c $CONCURRENT -v 2 -g results.gnu -e results.csv $TARGET_URL
