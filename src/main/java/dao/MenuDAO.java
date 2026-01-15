package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Menu;
import util.KoneksiDB;

public class MenuDAO {

    public List<Menu> getAllMenu() {
        List<Menu> list = new ArrayList<>();
        // UBAH DISINI: Tambahkan WHERE is_active = true
        String sql = "SELECT * FROM menus WHERE is_active = true ORDER BY id DESC";

        try (Connection conn = KoneksiDB.getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Menu m = new Menu();
                m.setId(rs.getInt("id"));
                m.setNama(rs.getString("nama"));
                m.setHarga(rs.getDouble("harga"));
                m.setKategori(rs.getString("kategori"));
                m.setFoto(rs.getString("foto"));
                list.add(m);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean insertMenu(Menu m) {
        String sql = "INSERT INTO menus (nama, harga, kategori, foto) VALUES (?, ?, ?, ?)"; // Tambah 's'
        try (Connection conn = KoneksiDB.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, m.getNama());
            ps.setDouble(2, m.getHarga());
            ps.setString(3, m.getKategori());
            ps.setString(4, m.getFoto());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            return false;
        }
    }

    public boolean updateMenu(Menu m) {
        String sql = "UPDATE menus SET nama=?, harga=?, kategori=?, foto=? WHERE id=?";
        try (Connection conn = KoneksiDB.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, m.getNama());
            ps.setDouble(2, m.getHarga());
            ps.setString(3, m.getKategori());
            ps.setString(4, m.getFoto());
            ps.setInt(5, m.getId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            return false;
        }
    }

    public boolean deleteMenu(int id) {
        // UBAH DISINI: Jangan DELETE, tapi UPDATE
        String sql = "UPDATE menus SET is_active = false WHERE id=?";

        try (Connection conn = KoneksiDB.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            return false;
        }
    }

    public int getMenuCount() {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM menus WHERE is_active = true"; // Sesuaikan jika tidak pakai is_active, hapus WHERE-nya
        try (Connection conn = KoneksiDB.getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
}
