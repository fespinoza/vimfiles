module NewHashSyntax
  def self.hello_world
    puts "holaa"
  end

  def self.regexp
    /.*(?<old_hash>:(?<key>[\w]*) ?=> ?(?<value>.*)).*/
  end

  def self.update_hashes(from)
    to = from
    while md = regexp.match(to)
      old_hash = md[:old_hash]
      new_hash = "#{md[:key]}: #{md[:value]}"
      to = to.sub(old_hash, new_hash)
    end
    to
  end
end
