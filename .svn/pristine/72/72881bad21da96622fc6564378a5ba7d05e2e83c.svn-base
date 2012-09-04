package eventos


class ImagemService {
    def burningImageService

    def getImagem(def id, def largura, def altura) {
        def result = Imagem.withCriteria {
            or {
                and {
                    eq('id', id)
                    if (largura && largura > 0) eq('largura', largura)
                    if (altura && altura > 0)   eq('altura', altura)
                }
                and {
                    eq('imagemOriginal.id', id)
                    if (largura && largura > 0) eq('largura', largura)
                    if (altura && altura > 0)   eq('altura', altura)
                }
            }
        }

        if (result) {
            return result[0]
        } else {
            def imagemOriginal = Imagem.get(id)
            def aspectRatio    = (imagemOriginal.largura as float) / (imagemOriginal.altura as float)
            def newAltura      = (largura / aspectRatio) as int

            def tempDir = System.getProperty("java.io.tmpdir")
            def newImg

            def tempFile = File.createTempFile("img_", imagemOriginal.nomeArquivo)
            tempFile.withOutputStream { s ->
                s << imagemOriginal.imagem
            }

            burningImageService.doWith(tempFile.absolutePath, tempDir).execute {
                it.scaleAccurate(largura, newAltura)
            }

            def novaImagem = new Imagem(
                imagem: new File(tempDir, tempFile.getName()).bytes,
                nomeArquivo: imagemOriginal.nomeArquivo,
                largura: largura,
                altura: altura,
                imagemOriginal: imagemOriginal).save()

            return novaImagem
        }
    }
}

