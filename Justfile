list:
    just -l

update:
    nix flake update

upgrade-hm:
    home-manager switch --flake ~/nixos-config#blucin@camelot

upgrade-sys:
    sudo nixos-rebuild switch --flake ~/nixos-config#camelot

clean-sys:
    sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d

default := 'nil'

clean-hm IDS=default:
    @if test "{{ IDS }}" = "nil" -o -z "{{ IDS }}"; then \
        echo "No generation IDs provided."; \
        echo "Usage: just-hm IDS=\"<id1> <id2> ...\""; \
        echo "Listing all home-manager generations:"; \
        home-manager generations; \
    else \
        home-manager remove-generations {{ IDS }}; \
    fi

gc:
    sudo nix-collect-garbage --delete-old
