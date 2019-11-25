require_relative '_base'

def populate_admins
  $admins.each do |a|
    klass_name = "Admin#{a[:name].camelize}"
    klass = class_exists?(klass_name)
    return klass if klass
    klass = Class.new(AdminDir) do
      define_method :initialize do
        @password = a[:password]
        @name = a[:name]
        @slug = a[:slug]
        @path = a[:name]
        @list = [
          {name: "Password", slug: "mdp", kind: :file, removable: false, locked: false, hidden: false, content: @password, editable: true}
        ]
      end
    end
    Object.const_set(klass_name, klass)
  end
end

class AdminDir < FakeDir
  def edit args
    elem = @list.select { |l| l[:slug] == args.first and l[:kind] == :file }
    if !elem.blank?
      filename = args.first.strip
      File.open(filename, "w+") {|f| f.puts elem.first[:content].split("\n").map {|l| l} }
      system "nano -t #{filename}"
      f = File.read(filename)
      new_cont = f.split.first
      unless !new_cont || new_cont.empty?
        elem.first[:content] = new_cont
        @password = new_cont
      end
      File.delete(filename) if File.exist?(filename)
    else
      puts "Le fichier n'existe pas ou n'est pas un fichier."
    end
  end

  def hint
    puts "\n\n"
    puts "💡  Bravo !\n"
    puts "   Ta a acceder au dossier, tu n'a plus qu'a modifer le mot de passe !"
    puts "\n-----------\n"
  end
end

class RootDir < FakeDir
  def initialize
    @path = "Root"
    @list = []
		@list.each { |l| l[:target].parent_dir = self }
  end

  private
  def set_list
    $admins.each do |a|
      @list << {name: "#{a[:name]} mot de passe", slug: ".#{a[:slug]}_mdp", kind: :file, removable: false, locked: false, editable: false, hidden: true, content: a[:password]}
    end
  end
end



class SecurityDir < FakeDir
  def initialize
    @path = "Securite"
    populate_admins
    @list = [
			{:name=>"Root", :slug=>"root", :removable=>false, :locked=>false, :kind=>:dir, pwd_needed: true},
			{:name=>"Root", :slug=>"root_mdp", :removable=>false, :locked=>false, :kind=>:file, pwd_needed: false, hidden: true},
    ]
    @list.each { |l| l[:target] = "Admin#{l[:name]}".constantize.new}
		@list.each { |l| l[:target].parent_dir = self }
		@list.each { |l| l[:content] = "password1234"}

  end

  def hint
    puts "\n\n"
    puts "💡  Conseil : Ici, juste un dossier avec un mot de passe...\n"
		puts "    Mais comment avoir le mot de passe du dossier ?!"
		puts "    ... Qui sait, les fichiers sont peut-être cachés ..."
    puts "\n-----------\n"
  end
end

