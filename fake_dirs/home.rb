require_relative '_base'

class HomeDir < FakeDir
  def initialize
    @path = "home"
    @list = [
      {name: 'Planètes', slug: 'planetes', removable: false, locked: false, kind: :dir, target: $planetes_dir},
      {name: 'Analyses', slug: 'analyses', removable: false, locked: false, kind: :dir, target: $analyses_dir},
      {name: 'Securité', slug: 'securite', removable: false, locked: false, kind: :dir, target: $security_dir},
      {name: 'Admin', slug: 'admin', removable: false, locked: false, kind: :dir, target: $admin_dir}
    ]
    @list.each { |l| l[:target].parent_dir = self if l[:target]}
    $admin_part_dir.parent_dir = self
  end

  def hint
    puts "\n\n"
    puts "💡  Conseil : Dans ce dossier, tu vas pouvoir te balader dans le système informatique du vaisseau.\n"
    puts "   Tape les commandes ls et cd pour continuer."
    puts "\n-----------\n"
  end

  def progres
    puts "\n🤖 4LFR3D:".colorize(:light_blue)
    if mdp_changed?
      puts "Mot de passe d'un administrateur changé : " + " oui".colorize(:green)
    else
      puts "Mot de passe d'un administrateur changé : " + " non".colorize(:red)
    end
    if !mails_sent?
      puts "Mails envoyés aux collaborateurs :" + " non".colorize(:red)
    else
      puts "Mails envoyés aux collaborateurs :" + " oui".colorize(:green)
    end
    if $admin_part_dir.temperature_des_reacteurs >= 400 && !$admin_part_dir.systeme_de_refroidissement_enclanche && $admin_part_dir.aerations_ouvertes <= 1
      puts "Sécurité du système affaiblie :" + " oui".colorize(:green)
    else
      puts "Sécurité du système affaiblie :" + " non".colorize(:red)
    end
    puts "\n"
  end

  def mails_sent?
    $planetes_dir.list.each do |l|
      return false unless l[:target].emailed
    end
    true
  end

  def mdp_changed?
    return true unless $admins[20][:password] == "E2R5"
    false
  end

end
