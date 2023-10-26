function й
  echo й $argv | __translate_macos_bulgarian_qwerty_to_abc | source
end

function __translate_macos_bulgarian_qwerty_to_abc
  ruby -e '\
    BULGARIAN_QWERTY_LAYOUT = \'чявертъуиопшщюасдфгхйклзьцжбнмЧЯВЕРТЪУИОПШЩЮАСДФГХЙКЛЗѝЦЖБНМ\'
    ENGLISH_ABC_LAYOUT      = \'`qwertyuiop[]\asdfghjklzxcvbnm~QWERTYUIOP{}|ASDFGHJKLZXCVBNM\'

    translation =
      Hash.new { |_, key| key }.tap do |dict|
        BULGARIAN_QWERTY_LAYOUT.each_char.with_index { |char, index| dict[char] = ENGLISH_ABC_LAYOUT[index] }
      end

    $stdin.each_char { |char| $stdout.putc translation[char] }
  '
end
