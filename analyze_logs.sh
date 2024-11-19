
#!/bin/bash


total_requests=$(wc -l < access.log)

unique_ips=$(awk '{print $1}' access.log | sort | uniq | wc -l)

method_counts=$(awk '{print $6}' access.log | tr -d '"' | sort | uniq -c)

popular_url=$(awk '{print $7}' access.log | sort | uniq -c | sort -nr | head -n 1)

{
    echo "Web server log report"
    echo "====================="
    echo "Total requests: $total_requests"
    echo "Number of unique IP addresses: $unique_ips"
    echo "Number of requests by method:"
    echo "$method_counts"
    echo "Most popular URL: $popular_url"
} > report.txt
echo "report saved to file report.txt"
