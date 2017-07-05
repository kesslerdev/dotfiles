
#sql


update_cap_tools() {
    echo "Upgrade IED Capistrano tools"
    git clone git@github.com:inextensodigital/capistrano_tools.git /tmp/capistrano_tools && cd /tmp/capistrano_tools && gem build ied_capistrano_tools.gemspec && sudo gem install $(ls | grep '.gem$' | sort -r | head -n 1) && rm -rf /tmp/capistrano_tools 
}