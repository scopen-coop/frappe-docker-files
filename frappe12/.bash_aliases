alias bench-fix='bench setup requirements && bench --site all migrate && bench build --force && bench --site all clear-cache && bench restart'
alias bench-fix-skip='bench setup requirements && bench --site all migrate --skip-failing && bench build --force && bench --site all clear-cache && bench restart'
alias ll='ls -la'
