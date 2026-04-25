{ pkgs, ... }:
{
  xdg.configFile."wireplumber/wireplumber.conf.d/51-default-devices.conf" = {
    text = ''
      monitor.alsa.rules = [
        {
          matches = [
            {
              node.name = "~alsa_input.usb-0c76_USB_PnP_Audio_Device.*"
            }
          ]
          actions = {
            update-props = {
              priority.session = 1000
            }
          }
        }
      ]
    '';
  };

  xdg.configFile."pipewire/pipewire.conf.d/99-deepfilternet.conf" = {
    text = builtins.toJSON {
      "context.modules" = [
        {
          name = "libpipewire-module-filter-chain";
          args = {
            "node.description" = "DeepFilter Noise Canceling source";
            "media.name" = "DeepFilter Noise Canceling source";

            "filter.graph" = {
              nodes = [
                {
                  type = "ladspa";
                  name = "DeepFilter Mono";
                  plugin = "libdeep_filter_ladspa";
                  label = "deep_filter_mono";
                  control = {
                    "Attenuation Limit (dB)" = 100;
                  };
                }
              ];
            };

            "audio.rate" = 48000;
            "audio.position" = [ "MONO" ];

            "capture.props" = {
              "node.passive" = true;
            };
            "playback.props" = {
              "media.class" = "Audio/Source";
            };
          };
        }
      ];
    };
  };
}
