resource "kubernetes_manifest" "infisical_secret" {
  manifest = {
    apiVersion = "bitnami.com/v1alpha1"
    kind       = "SealedSecret"

    metadata = {
      name      = "infisical"
      namespace = "default"
    }

    spec = {
      encryptedData = {
        client_secret = "AgCE66EEMzuyQlujvlSum1nx7EJh7/izcHgSIoY2KY0PMm9GUGpnYfNI04JTh7vOyyH14TRSj9F6lNZXh21SqLxtJlPNMw2CTKFRHIDwoaK6Falc7DPjNzMysrQFuBBI5sCJOvRuR1B1AC3OzgfTNDAJMTvm4ATlu16PaUNL2tjinpZmjF1Rlbu71HB9+7eaKRtQ9/2609JmiWII2HwvWugmMcR0THtGcQs5cJQSdyv4TockO0ogtHMTO2ETD9x88ovOiJsSrEF1ssI/8MU126OWPB+5x4/42fM2L2cRyPBtyfPppvhZGmWNk/Q12y9ubn7xYDH3EYczNH/Mmp+4dJb3KpzSAJEi5G8xG9XojSkHSOiT3azJGAyek/fyaGfJKIXJUYgf+L5IanRRPwTHdFTP5sp6Oxk6AGRLCYK3ioaIS1vlfSMpCW9tijtnz71wruXizC3Sw+CuHuqqbgqRfB9UqbHSyhDHYkYEHteOCXgYCyMHdBC/4HgTDmpj+iPH0PLjtOYAYm/7QNFNjn+zRtjsr9o8SYl5TxWlxK7nzpL8JfwA/go+rRMOxsGL1MFrQTvlRXOqjowGd8MEiMkm8GpenBfQSK/vE7/QOxr1tONmOZIKQQy53ch3Lc3YwOsOunmcT8EWXoTy4Bal98WclFRT33hvC5MpHu0NeAmBsxeW8GjGZJ1N5xdLWunFtZ8ezMwUNHkW963jXziTl6XIsrc58xT5SmfyQaWQwvHNUW+jeKKMHx9wr5V5lqMpS8DiH3bY1/nGeNgJ8wYJLp/h0/8Y"
        client_id = "AgBoRGgrGXxHqunjCiECht0ytfRzFSYqNNXrT3LCDNK/ymUpXV80UsSHvHIoyIa7K+ufR39lc4Jgugq2mEboPs5G4s/r3M1HFEaO1F4ttYwLVbhk9TA6xenxs97qVkGxkhl8PC1cEQQI1liageQ9StRT5USovkeqqZzJ5PFPoNXfUxPrgagegZSpbq+5tYwTUiUHE/jy65wNK9p1cNn5tdLhLwfEgSJ1viPXOef5Dtr4Si8je0X9NvEFbnPGelFyjmhrvi/k0NqdsIsudOJkXcSXYOWtKE5YN/hPeH2RWJa/u0dl+aF7STReefgGVvMgW+T9N+yOqUGfOxs0VlTlfgPJSY3073Y3lJcBKJVxllcT/Nd5t4j2IiEXPORvSovWPsjDQBE2R+OlI7VL1c9+2k11YGp97ENVhLGgIVS3QUjihzj0UG8XPerPIHEuGt22VExjdrYKfRI7xNeRPnDu6fmGAxhlnnOh/TPi2qc0Lyhw5iBXpEiWMkXy/oyxdvAQpDBoR68K1lKnC+b+y9JJ51TPTX03MO3gi34oJQbNF+9V8NG3Xtqprzl2Y3xgiqJcw551JbtPa22HUVUg8D5ZEjRNWhCYtEli4dVcoZzt82VQbM4w7Tg5+pGBnGYQxeHNlL+7ks8pQyU2Myk5JBLxYMZn0zC83VYCeiiVXyWW6YauJWoL5bAvHPq+szYViXUtV82AQLHCFa4Lm7BYdJIDlW7g3+eSdW/+lyUupWHw7B+UAI8U7Gc="
      }

      template = {
        metadata = {
          name      = "infisical"
          namespace = "default"
        }
      }
    }
  }
}
