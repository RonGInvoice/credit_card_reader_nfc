package com.credit_card_reader_nfc_flutter

import android.nfc.tech.IsoDep
import android.nfc.TagLostException
import android.util.Log
import com.github.devnied.emvnfccard.parser.IProvider
import java.io.IOException

class IsoProvider(val tag: IsoDep): IProvider {
    override fun transceive(command: ByteArray): ByteArray {
        try {
            return tag.transceive(command)
        } catch(e: TagLostException) {
            Log.d("ERROR", "Tag was lost")
            
            return byteArrayOf()
        } catch(e: IOException) {
            e.printStackTrace()

            return byteArrayOf()
        }
    }

    override fun getAt(): ByteArray {
        return tag.getHistoricalBytes()
    }
} 